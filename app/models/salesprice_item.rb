class SalespriceItem
  include ActiveModel::Model
  attr_accessor :day, :price, :item_id, :num, :sales_price_id

  with_options presence: true do
    validates :day
    validates :price
    validates :item_id
    validates :num
    validates :sales_price_id
  end
end
