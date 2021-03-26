class SalesController < ApplicationController
  before_action :auth_Check

  def index
    @sales = SalesPrice.all
    binding.pry
  end

  def new
    @items = Item.all
    @sales = SalesPrice.new
  end

  def create
    @sales = SalesPrice.new(sales_params)
    @items = Item.all
    if @sales.valid?
      @sales.save
      redirect_to items_path, notice: "登録に成功しました"
    else
      render :new
    end
  end

  def sales_list
    @sales = SalesPrice.new
  end

  def search

  end

  private

  def sales_params
    params.require(:sales_price).permit(:day, :price)
  end

  def day_join
    date = params[day]
  end
end
