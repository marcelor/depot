class User < ActiveRecord::Base
  after_destroy :ensure_an_admin_remains
  validates :name, presence: true, uniqueness: true
  has_secure_password

  private
    def ensure_an_admin_remains
      if User.count.zero?

        # if we don't want to signal an excpetion then:
        # raise ActiveRecord::Rollback

        raise "Can't delete last user"
      end
    end
end
