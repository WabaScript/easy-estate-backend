class CreateListingImageBins < ActiveRecord::Migration[6.0]
  def change
    create_table :listing_image_bins do |t|
      t.integer :listing_id
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :image4
      t.string :image5
    end
  end
end
