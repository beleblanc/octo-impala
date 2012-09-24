class ChangeJudgeCommentsToText < ActiveRecord::Migration
  def change
    change_column :case_details, :judge_remarks, :text
    
  end
end
