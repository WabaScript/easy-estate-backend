class Listing < ApplicationRecord
    has_many :follow_listings, foreign_key: :listing_id
    has_many :followers, through: :follow_listings

    belongs_to :owner, :class_name => "User", foreign_key: :owner_id
    
    has_many :comments

    has_one :listing_image_bin

    has_many_attached :images

    serialize :default_image, Array

    validates :price, presence: true
end
