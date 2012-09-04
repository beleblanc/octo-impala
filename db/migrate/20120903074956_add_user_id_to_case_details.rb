class AddUserIdToCaseDetails < ActiveRecord::Migration
  def change
    add_column :case_details, :user_id, :integer
    add_index :case_details, :user_id
  end
end
