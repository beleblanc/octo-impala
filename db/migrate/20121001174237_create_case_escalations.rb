class CreateCaseEscalations < ActiveRecord::Migration
  def change
    create_table :case_escalations do |t|
      t.belongs_to :case_detail
      t.belongs_to :user
      t.date :approved_on
      t.boolean :approved

      t.timestamps
    end
    add_index :case_escalations, :case_detail_id
    add_index :case_escalations, :user_id
  end
end
