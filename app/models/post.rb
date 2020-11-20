class Post < ApplicationRecord
  # has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: {maximum: 140 }
  validates :content, length: { maximum: 3000 }
end
