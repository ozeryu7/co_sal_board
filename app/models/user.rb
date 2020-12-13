class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  # 不要の可能性あり、バリデーションはconfig/devise.rbで出来ている
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :name, presence: true
  # validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  # validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, presence: true, length: { in: 8..32 }
  # validates :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, presence: true, length: { in: 8..32 }

  has_many :posts, dependent: :destroy
  # has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    
    unless user
      user = User.new(
        uid: auth.uid,
        provider: auth.provider,
        email: auth.info.email, #ダミー入れる可能性あり
        password: Devise.friendly_token[0,20],
        name: auth.info.name
      )
      user.skip_confirmation!
      user.save(validate: false)
    end
    user
  end
end
