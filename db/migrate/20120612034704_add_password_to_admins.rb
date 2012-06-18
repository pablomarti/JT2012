class AddPasswordToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :password_hash, :string
    add_column :admins, :password_salt, :string
  end
end
