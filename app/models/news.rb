class News < ApplicationRecord

  # バリデーション
  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :content, length: { maximum: 1000 }
  end

  # アソシエーション
  belongs_to :user

  has_one_attached :image
end
