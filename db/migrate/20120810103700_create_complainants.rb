class CreateComplainants < ActiveRecord::Migration
  def change
    create_table :complainants do |t|
      t.string :first_name
      t.string :surname
      t.string :sex
      t.date :date_of_birth
      t.references :cases

      t.timestamps
    end

    add_column :constituencies, :region_id, :integer
  end
end
