class CreateRoadTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :road_trips do |t|
      t.string :origin
      t.string :destination
      t.integer :travel_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
