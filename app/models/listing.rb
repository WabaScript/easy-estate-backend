class Listing < ApplicationRecord
    has_many :follow_listings, foreign_key: :listing_id
    has_many :followers, through: :follow_listings

    belongs_to :owner, :class_name => "User", foreign_key: :owner_id
    
    has_many :comments

    validates :price, presence: true
end
