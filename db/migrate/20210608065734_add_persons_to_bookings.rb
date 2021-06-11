class AddPersonsToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :persons, :integer
  end
end
