class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.references :departure_airport, null: false, foreign_key: true
      t.references :arrival_airport, null: false, foreign_key: true
      t.datetime :start
      t.integer :duration

      t.timestamps
    end
  end
end
