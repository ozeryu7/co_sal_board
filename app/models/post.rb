class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one_attached :image

  validate :image_type
  validates :title, presence: true, length: {maximum: 140 }
  validates :content, length: { maximum: 3000 }

    def thumbnail input
      return self.images[input].variant(resize: '300x300!').processed
    end

    def image_type
      return unless image.attached?
        if image.blob.byte_size > 10.megabytes
          image.purge
          errors.add(:image, 'ファイルのサイズが大きすぎます')
        elsif !image?
          image.purge
          errors.add(:image, 'ファイルが対応している画像データではありません')
        end
      end
    end
  private

  def image?
    %w[image/jpg image/jpeg image/gif image/png].include?
    (image.blob.content_type)
  end