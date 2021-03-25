class SalesPrice < ApplicationRecord

  # has_many :sales_items
    # バリデーション
    with_options presence: true do
      validates :day
      validates :price
    end
end
