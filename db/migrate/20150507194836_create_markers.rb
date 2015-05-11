class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.string :title, null: false
      t.string :comment, null: true
      t.decimal :longitude, precision: 10, scale: 6, null: false
      t.decimal :latitude, precision: 10, scale: 6, null: false

      t.timestamps null: false
    end
  end
end
