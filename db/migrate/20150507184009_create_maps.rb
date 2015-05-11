class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :title, null: false

      t.timestamps null: false
    end
  end
end
