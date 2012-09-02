class CreateProsecutors < ActiveRecord::Migration
  def change
    create_table :prosecutors do |t|
      t.string :first_name
      t.string :surname
      t.string :sex, :length=>1
      t.references :region

    end
  end
end
