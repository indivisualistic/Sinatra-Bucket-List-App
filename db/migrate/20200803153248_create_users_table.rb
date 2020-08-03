class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :user |t|
    t.string :name
    t.string :email
    t.string :password_digest
  end
end
