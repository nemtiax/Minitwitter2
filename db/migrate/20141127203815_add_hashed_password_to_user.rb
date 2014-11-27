class AddHashedPasswordToUser < ActiveRecord::Migration
  def change
	add_column :users, :hashed_password, :string
	remove_column :users, :password, :string
  end
end
