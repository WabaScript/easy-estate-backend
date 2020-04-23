class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :content, presence: true
  validates :content, length: { maximum: 400 }
end
