class ItemsController < ApplicationController
  before_action :auth_Check
  def index

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  def items_list
    @items = Item.order(created_at: :DESC)
  end

  private

  # 管理者以外はルートぱすへ遷移
  def auth_Check
    if !user_signed_in?
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(
      :name,
      :content,
      :price,
      :category_id,
      :season_id,
      :sale_id,
      :image
    ).merge(user_id: current_user.id)
  end

end
