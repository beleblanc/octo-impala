class CreateAppeals < ActiveRecord::Migration
  def change
    create_table :appeals do |t|
      t.integer :accused_id
      t.string :case_detail_id
      t.string :court_type
      t.string :case_number
      t.string :prosecutor
      t.string :representative
      t.date :received_on
      t.date :commenced_on
      t.date :concluded_on
      t.string :reason_for
      t.boolean :conviction_appeal_allowed
      t.boolean :conviction_appeal_disallowed
      t.boolean :sentence_appeal_allowed
      t.boolean :sentence_appeal_disallowed
      t.text :conviction_disallowed_reason
      t.text :sentence_disallowed_reason
      t.text :new_sentence
      t.text :judge_remarks

      t.timestamps
    end
    add_index :appeals, :accused_id
    add_index :appeals,:case_detail_id
  end
end
