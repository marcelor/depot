class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts, force: true do |t|
      t.string :number
      t.decimal :balance, precision: 10, scale: 2, default: 0
    end
  end
end
