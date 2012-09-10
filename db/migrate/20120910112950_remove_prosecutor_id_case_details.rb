class RemoveProsecutorIdCaseDetails < ActiveRecord::Migration
  def change
    remove_column :case_details,:prosecutor_id
  end
end
