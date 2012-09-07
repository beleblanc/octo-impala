class DropTableProsecutors < ActiveRecord::Migration
  def up
    drop_table :prosecutors
  end

  def down
  end
end
