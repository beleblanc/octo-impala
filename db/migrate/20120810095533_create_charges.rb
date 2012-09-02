class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :name, :null=>false , length:50
    end
  end
end
