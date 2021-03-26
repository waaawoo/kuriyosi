class SalesController < ApplicationController
  before_action :auth_Check

  def index
    @sales = SalesPrice.all
    @p = SalesPrice.ransack(params[:q])  # 検索オブジェクトを生成
    @results = @p.result(distinct: true).order(day: :desc).limit(30) # 検索条件にマッチした商品の情報を取得
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

  def edit
    @items = Item.all
    @sales = SalesPrice.find(params[:id])
  end

  def update
    @sales = SalesPrice.find(params[:id])
    if @sales.update(sales_params)
      redirect_to items_path, notice: "編集に成功しました"
    else
      render :edit
    end
  end

  private

  def sales_params
    params.require(:sales_price).permit(:day, :price)
  end
end
