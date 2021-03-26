class SalesPrice < ApplicationRecord

  # has_many :sales_items
    # バリデーション
    with_options presence: true do
      validates :day, uniqueness: true
      validates :price
    end

end
