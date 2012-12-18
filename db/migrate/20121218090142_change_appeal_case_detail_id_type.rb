class ChangeAppealCaseDetailIdType < ActiveRecord::Migration
 def change
   remove_column :appeals, :case_detail_id
   add_column :appeals,:case_detail_id,:integer, :null => false
   add_index :appeals, :case_detail_id
 end
end
