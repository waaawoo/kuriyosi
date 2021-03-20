class StoresController < ApplicationController
  before_action :auth_Check, only: [:new, :create, :edit, :upadate, :destroy]

  def index
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to items_path, notice: "登録に成功しました"
    else
      render :new
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update

  end

  private
  def store_params

  end
  # 管理者以外はルートぱすへ遷移
  def auth_Check
    if !user_signed_in?
      redirect_to root_path
    end
  end

  def store_params
    params.require(:store).permit(
      :name,
      :phone,
      :address,
      :open_time,
      :close_time,
      :holiday_id,
      images: []
    )
  end
end
