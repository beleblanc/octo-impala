class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name
      t.text :description
      
      t.references :attacheable, polymorphic: true
      t.attachment :file

      t.timestamps
    end
  end
end
