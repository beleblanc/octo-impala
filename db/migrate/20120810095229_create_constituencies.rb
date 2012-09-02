class CreateConstituencies < ActiveRecord::Migration
  def change
    create_table :constituencies do |t|
      t.string :name, :null=> false, :length=>100
    end
  end
end
