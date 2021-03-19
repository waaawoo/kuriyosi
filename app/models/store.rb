class Store < ApplicationRecord

  # バリデーション
  with_options presence: true do
    validates :name
    validates :phone
    validates :address
    validates :open_time
    validates :close_time
    with_options numericality: { other_than: 1 } do
      validates :holiday_id
    end
  end

  # モジュールの読み込み
  extend ActiveHash::Associations::ActiveRecordExtensions
  # activehash
  belongs_to_active_hash :holiday
  # activestorage
  has_many_attached :images
end
