class CreateCaseLinkages < ActiveRecord::Migration
  def change
    create_table :case_linkages do |t|
      t.integer :case_detail_id
      t.integer :linked_case_id

      t.timestamps
    end
    add_index :case_linkages, :case_detail_id
    add_index :case_linkages, :linked_case_id
  end
end
