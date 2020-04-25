class User < ApplicationRecord
    has_many :follow_listings, foreign_key: :follower_id
    has_many :followed_listings, through: :follow_listings

    has_many :listings, foreign_key: :owner_id

    has_many :comments

    has_secure_password
    validates :email, uniqueness: true

end
