class CreateFollowListings < ActiveRecord::Migration[6.0]
  def change
    create_table :follow_listings do |t|
      t.integer :follower_id
      t.integer :listing_id

      t.timestamps
    end
  end
end
