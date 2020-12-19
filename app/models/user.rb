class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_many :posts, dependent: :destroy
  # has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.find_for_oauth(auth) #auth facebookの情報が入る
    user = User.where(uid: auth.uid, provider: auth.provider).first #uid:ユーザー識別のid、同じ人いないか検索している
    
    unless user
      user = User.new(
        uid: auth.uid,
        provider: auth.provider,
        email: auth.info.email, #ダミー入れる可能性あり
        password: Devise.friendly_token[0,20],
        name: auth.info.name
      )
      user.skip_confirmation!　#メール認証飛ばしている
      user.save(validate: false) 
    end
    user
  end
end
