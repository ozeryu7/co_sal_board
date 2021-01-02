class Post < ApplicationRecord
  # has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many_attached :images

  validate :image_type
  validates :title, presence: true, length: {maximum: 140 }
  validates :content, length: { maximum: 3000 }

    def thumbnail input
      return self.image[input].variant(resize: '300x300!').processed
    end

    private

        def image_type
          if images.each do |image|
            if !image.content_type.in?(%('image/jpec image/png image/jpg image/jpeg'))
              errors.add(:images, 'ファイルが対応している画像データではありません')
            end
          end
        end
    end
end