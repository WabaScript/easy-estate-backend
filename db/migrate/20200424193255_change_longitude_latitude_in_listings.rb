class ChangeLongitudeLatitudeInListings < ActiveRecord::Migration[6.0]
  def change
    change_column :listings, :latitude, :decimal, { precision: 10, scale: 6 }
    change_column :listings, :longitude, :decimal, { precision: 10, scale: 6 }
  end
end
