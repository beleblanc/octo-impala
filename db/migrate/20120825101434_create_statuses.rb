class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name

      #t.timestamps
    end
    
    rename_column :case_details, :status, :status_id
  end
end
