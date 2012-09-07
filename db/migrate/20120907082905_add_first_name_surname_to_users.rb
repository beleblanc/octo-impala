class AddFirstNameSurnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :surname, :string
    add_column :users, :region_id, :integer
    add_index :users, :region_id
    add_column :users,:sex, :string, :length => 1

  end
end
