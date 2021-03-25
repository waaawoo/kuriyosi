class SalesController < ApplicationController
  before_action :auth_Check

  def index

  end

  def new
    @salesprice_item = SalespriceItem.new
    @items = Item.all
  end

  def create
    @salesprice_item = SalespriceItem.new(sales_params)
    binding.pry

    if @salesprice_item.valid?
      @salesprice_item.save
      redirect_to items_path, notice: "登録に成功しました"
    else
      binding.pry
      @items = Item.all
      render :new
    end
  end

  private

  def sales_params
    params.require(:salesprice_item).permit(:day, :price, :item_id, :num)
  end
end
