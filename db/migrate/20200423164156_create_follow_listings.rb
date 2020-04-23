class CreateFollowListings < ActiveRecord::Migration[6.0]
  def change
    create_table :follow_listings do |t|
      t.references :follower_id, null: false, foreign_key: true
      t.references :listing_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
