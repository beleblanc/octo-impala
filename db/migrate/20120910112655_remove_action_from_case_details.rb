class RemoveActionFromCaseDetails < ActiveRecord::Migration
  def change
    remove_column :case_details,:action_id
  end
end
