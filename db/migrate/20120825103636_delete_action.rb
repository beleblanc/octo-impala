class DeleteAction < ActiveRecord::Migration
  def change
    drop_table :actions
    
  end
end
