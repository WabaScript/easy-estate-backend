class RemoveGoogleMapsIdFromListings < ActiveRecord::Migration[6.0]
  def change

    remove_column :listings, :google_maps_id, :integer
  end
end
