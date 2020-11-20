class UsersController < ApplicationController
    has_many :posts, dependent: :destroy
    # has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    devise :database_authenticatable, :registerable.
           :recoverable, :rememberable, :validatable

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, presence: true, length: { in: 8..32 }
    validates :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, presence: true, length: { in: 8..32 }

  # def already_liked?(post)
  #   self.likes.exists?(post_id: post.id)
  # end
end
