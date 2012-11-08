class RenameCaseIdToCaseDetailId < ActiveRecord::Migration
  def change
#    rename_column :complainants, :case_id, :case_detail_id
    rename_column :accuseds, :case_id, :case_detail_id
  end
end
