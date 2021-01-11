class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one_attached :image

  validate :image_type
  validate :image_size
  validates :title, presence: true, length: {maximum: 140 }
  validates :content, length: { maximum: 3000 }

  private

  #一つにしても良いので後ほどやる
  def image_type
    if image.attached?
      if !image.blob.content_type.in?(%('image/jpeg image/png image/jpg'))
        image.purge
        errors.add(:image, 'はjpegまたはpngまたはjpg形式でアップロードしてください')
      end
    end
  end

  def image_size
    # image.each do |image|
    if image.attached?
      if image.blob.byte_size > 5.megabytes
        image.purge
        errors.add(:image, "は1つのファイル5MB以内にしてください")
      end
    end
    # end
  end
end