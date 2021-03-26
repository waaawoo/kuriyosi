class SalesController < ApplicationController
  before_action :auth_Check
  before_action :search_slase, only: [:index, :search]

  def index
    @sales = SalesPrice.all
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

  def search
    # binding.pry
    @results = @p.result(distinct: true)# 検索条件にマッチした商品の情報を取得
  end

  private

  def sales_params
    params.require(:sales_price).permit(:day, :price)
  end

  def search_slase
    @p = SalesPrice.ransack(params[:q])  # 検索オブジェクトを生成
  end

  # def set_day_column
  #   @day_info = SalesPrice.select("day").distinct
  # end

end
