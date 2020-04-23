class FollowListing < ApplicationRecord
  belongs_to :follower, foreign_key: :follower_id, class_name: "User"
  belongs_to :followed_listings, foreign_key: :listing_id, class_name: "Listing"
end
