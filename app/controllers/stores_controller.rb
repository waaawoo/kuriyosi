class StoresController < ApplicationController
  before_action :auth_Check, only: [:new, :create, :edit, :upadate, :destroy]

  def index
  end

  def new
    @store = Store.new
  end

  def create

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
end
