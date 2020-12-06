class UsersController < ApplicationController
  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  # def already_liked?(post)
  #   self.likes.exists?(post_id: post.id)
  # end
end
