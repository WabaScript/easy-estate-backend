class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.integer :owner_id
      t.string :e_contact
      t.string :p_contact
      t.string :address
      t.string :state
      t.integer :zipcode
      t.string :neighborhood
      t.text :features
      t.integer :bed
      t.integer :bath
      t.integer :sqr_foot
      t.string :default_image
      t.integer :longitude
      t.integer :latitude
      t.integer :google_maps_id

      t.timestamps
    end
  end
end
