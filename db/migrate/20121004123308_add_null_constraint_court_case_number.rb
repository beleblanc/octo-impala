class AddNullConstraintCourtCaseNumber < ActiveRecord::Migration
  def change
    change_column :case_details,:court_case_number, :string, :limit=>15, :null => true
  end

end
