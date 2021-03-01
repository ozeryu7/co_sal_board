class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many_attached :images

  validate :image_type
  validate :image_size
  validates :title, presence: true, length: {maximum: 140 }
  validates :content, length: { maximum: 3000 }

  private

  #一つにしても良いので後ほどやるelseif
  def image_type
    if images.attached?
      images.each do |image|
        if !image.blob.content_type.in?(%('image/jpeg image/png image/jpg'))
          image.purge
          errors.add(:images, 'はjpegまたはpngまたはjpg形式でアップロードしてください')
       end
      end
    end
  end

  def image_size
    if images.attached?
    images.each do |image|
       if image.blob.byte_size > 5.megabytes
         image.purge
         errors.add(:images, "は1つのファイル5MB以内にしてください")
       end
    end
    end
  end
end