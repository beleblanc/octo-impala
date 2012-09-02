class CreateCaseDetails < ActiveRecord::Migration
  def change
    create_table :case_details do |t|

            t.references :prosecutor, null:false
            t.references :judge, null:false
            t.string :rcci
            t.string :court_case_number, null:false
            t.integer :court_type
            t.date :date_of_offence
            t.references :region
            t.references :constituency
            t.date :date_reported
            t.date :date_submitted
            t.integer :action_taken
            t.integer :status
            t.text :comment
            t.date :date_trial_commenced
            t.date :date_trial_concluded
            t.string :judgment
            t.string :sentence
            t.text :reason_for_acquittal
            t.string :judge_remarks

            t.timestamps
    end

    drop_table :cases_charges

    create_table :case_details_charges, id:false do |t|
      t.references :case_details
      t.references :charges
    end
  end
end
