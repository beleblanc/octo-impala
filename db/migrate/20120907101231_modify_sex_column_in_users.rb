class ModifySexColumnInUsers < ActiveRecord::Migration
  def up
    change_column :users, :sex,:string, :limit=> 1
  end

  def down
  end
end
