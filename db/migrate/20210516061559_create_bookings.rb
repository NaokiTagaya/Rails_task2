class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :total_charge
      t.date :booking_start
      t.date :booking_end
      t.datetime :booking_confirmed
      t.integer :property_id
      t.integer :user_id

      t.timestamps
    end
  end
end
