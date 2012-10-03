class CreateCourtTypes < ActiveRecord::Migration
  def change
    create_table :court_types do |t|
      t.string :name, :limit=> 30

    end
    rename_column :case_details,:court_type, :court_type_id
    add_index     :case_details, :court_type_id
  end
end
