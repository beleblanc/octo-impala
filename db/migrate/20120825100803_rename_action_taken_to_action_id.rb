class RenameActionTakenToActionId < ActiveRecord::Migration
  def change
    rename_column :case_details, :action_taken,:action_id
    
  end
end
