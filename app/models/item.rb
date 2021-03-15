class Item < ApplicationRecord
  # バリデーション
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :content, length: { maximum: 1000 }
    validates :price, numericality: { greater_than_or_equal_to: 100, less_than: 5000 }
    validates :image
    validates :sale
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :season_id
    end
  end

  # association
  belongs_to :user

  # モジュールの読み込み
  extend ActiveHash::Associations::ActiveRecordExtensions
  # activehash
  belongs_to_active_hash :category
  belongs_to_active_hash :season
  belongs_to_active_hash :sale
  # activestorage
  has_one_attached :image
end
