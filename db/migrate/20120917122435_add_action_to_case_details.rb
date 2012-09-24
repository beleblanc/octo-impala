class AddActionToCaseDetails < ActiveRecord::Migration
  def change
    add_column :case_details, :action, :string
    add_column :accuseds, :age, :integer
    remove_column :accuseds, :date_of_birth
    add_column :complainants, :age, :integer
    remove_column :complainants, :date_of_birth
  end
end
