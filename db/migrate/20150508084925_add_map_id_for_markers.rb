class AddMapIdForMarkers < ActiveRecord::Migration
  def change
    add_column :markers, :map_id, :integer, null: false
  end
end
