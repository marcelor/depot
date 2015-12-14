class Encrypter
  def initialize(attrs_to_manage)
    @attrs_to_manage = attrs_to_manage
  end

  def before_save(model)
    @attrs_to_manage.each do |field|
      model[field].tr!("a-z", "b-za")
    end
  end

  def after_save(model)
    @attrs_to_manage.each do |field|
      model[field].tr!("b-za", "a-za")
    end
  end

  alias_method :after_find, :after_save
end

class ActiveRecord::Base
  def self.encrypt(*attr_names)
    encrypter = Encrypter.new(attr_names)

    before_save encrypter
    after_save encrypter
    after_find encrypter

    define_method(:after_find) {}
  end
end
