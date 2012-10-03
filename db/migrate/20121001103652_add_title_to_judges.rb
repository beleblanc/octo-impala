class AddTitleToJudges < ActiveRecord::Migration
  def change
    add_column :judges, :title, :string, :limit => "25", :default => "Magistrate"
    add_column :users, :title, :string, :limit => "25", :default=>"Prosecutor"
  end
end
