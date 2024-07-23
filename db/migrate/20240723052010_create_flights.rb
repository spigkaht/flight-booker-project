class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.string :flight_number
      t.datetime :start_datetime
      t.integer :flight_duration
      t.bigint :departure_airport_id, null: false
      t.bigint :arrival_airport_id, null: false

      t.timestamps
    end
    add_foreign_key :flights, :airports, column: :departure_airport_id
    add_foreign_key :flights, :airports, column: :arrival_airport_id
  end
end
