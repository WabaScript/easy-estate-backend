class DropListingimagebins < ActiveRecord::Migration[6.0]
  def change
    drop_table :listing_image_bins
  end
end
