class User < ApplicationRecord
    include Rails.application.routes.url_helpers
    
    has_many :follow_listings, foreign_key: :follower_id
    has_many :followed_listings, through: :follow_listings

    has_many :listings, foreign_key: :owner_id

    has_many :comments

    has_one_attached :image

    has_secure_password

    validates :email, uniqueness: true
    validates :first_name, :last_name, :email, :password, presence: true

    def uploaded_image
        return unless self.image.attached?
        polymorphic_url(self.image)
    end

    # def i_image
    #     return unless self.image.attached?
    
    #     self.image.blob.attributes
    #           .slice('filename', 'byte_size')
    #           .merge(url: image_url)
    #           .tap { |attrs| attrs['name'] = attrs.delete('filename') }
    #   end
    
    #   def image_url
    #     url_for(self.image)
    #   end


end
