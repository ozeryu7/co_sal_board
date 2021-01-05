class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

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
end
