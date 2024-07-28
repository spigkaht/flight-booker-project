class CreateJoinTableBookingsPassengers < ActiveRecord::Migration[7.1]
  def change
    create_join_table :bookings, :passengers do |t|
      t.index :booking_id
      t.index :passenger_id
    end
  end
end
