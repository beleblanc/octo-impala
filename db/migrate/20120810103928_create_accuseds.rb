class CreateAccuseds < ActiveRecord::Migration
  def change
    create_table :accuseds do |t|
      t.string :first_name
      t.string :surname
      t.string :sex
      t.date :date_of_birth
      t.boolean :known_to_complainant
      t.references :relation
      t.references :cases
      t.timestamps
    end
  end
end
