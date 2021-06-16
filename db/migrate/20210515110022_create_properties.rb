class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :room_name
      t.text :room_introduction
      t.integer :fee
      t.string :address

      t.timestamps
    end
  end
end
