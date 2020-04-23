class FollowListing < ApplicationRecord
  belongs_to :follower_id
  belongs_to :listing_id
end
