class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "follow_id"
  has_many :followers, through: :reverse_of_relationships, source: :user

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end
  
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.new(
        uid: auth.uid,
        provider: auth.provider,
        email: auth.info.email,
        password: Devise.friendly_token[0,20],
        name: auth.info.name
      )
      user.skip_confirmation!
      user.save(validate: false) 
    end
    user
  end

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
end
