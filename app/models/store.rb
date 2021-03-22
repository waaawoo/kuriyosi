class Store < ApplicationRecord

    # バリデーション
    with_options presence: true do
      validates :name, length: {maximum: 40}
      validates :phone, format: { with: /\A\d{10}\z/ }
      validates :address, length: {maximum: 100}
      validates :open_time
      validates :close_time
      validates :images
      with_options numericality: { other_than: 1 } do
        validates :holiday_id, numericality: { less_than: 8 }
      end
    end

    # モジュールの読み込み
    extend ActiveHash::Associations::ActiveRecordExtensions
    # activehash
    belongs_to_active_hash :holiday
    # activestorage
    has_many_attached :images
end
