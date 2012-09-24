class RenameActionToActionTaken < ActiveRecord::Migration
  def change
      rename_column :case_details, :action, :action_taken
  end
end
