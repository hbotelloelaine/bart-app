class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :place
      t.datetime :start_at
      t.datetime :end_at
      t.string :station_id

      t.timestamps null: true
    end
  end
end
