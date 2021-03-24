class SalesController < ApplicationController
  before_action :auth_Check

  def index

  end

  def new
    @sales = SalespriceItem.new
  end

  def create
    @sales = SalespriceItem.new(sales_params)
  end

  private

  def sales_params
    params.require(:sales).permit(:day, :price, :item_id, :num, :sales_price_id)
  end
end
