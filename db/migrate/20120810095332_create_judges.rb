class CreateJudges < ActiveRecord::Migration
  def change
    create_table :judges do |t|
      t.string :first_name, :null =>false, length: 50
      t.string :surname, :null =>false, length: 50
      t.string :sex , :length=>1
    end


  end
end
