class ChangeProsecutorToForeignKey < ActiveRecord::Migration
  def change
    remove_column :appeals, :prosecutor
    add_column :appeals,:prosecutor_id, :integer
    add_index :appeals, :prosecutor_id
  end
end
