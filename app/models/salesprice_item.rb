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

  def save
    sales_price = SalesPrice.create(day: day, price: price)
    SalesItem.create(item_id: item_id, num: num, sales_price_id: sales_price.id)
  end
end
