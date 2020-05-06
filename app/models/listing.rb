class Listing < ApplicationRecord
    include Rails.application.routes.url_helpers

    has_many :follow_listings, foreign_key: :listing_id
    has_many :followers, through: :follow_listings

    belongs_to :owner, :class_name => "User", foreign_key: :owner_id
    
    has_many :comments

    has_one :listing_image_bin

    has_many_attached :images

    serialize :default_image, Array
    
    def createdFormat
        self.created_at.strftime("%b, %d @ %I:%M %P")
    end

    def uploaded_images
        self.images.map { |i| url_for(i)}
    end
end
