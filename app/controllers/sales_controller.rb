class SalesController < ApplicationController
  before_action :auth_Check

  def index

  end

  def new
    @sales = SalespriceItem.new
    @items = Item.all
  end

  def create
    @sales = SalespriceItem.new(sales_params)
    if @sales.valid?
    else
      @items = Item.all
      render :new
    end
  end

  private

  def sales_params
    params.require(:salesprice_item).permit(:day, :price, :item_id, :num, :sales_price_id)
  end
end
