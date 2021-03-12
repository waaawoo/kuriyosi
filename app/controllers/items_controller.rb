class ItemsController < ApplicationController
  before_action :auth_Check
  def index

  end

  def new

  end

  def edit

  end

  def items_list

  end
  private

  # 管理者以外はルートぱすへ遷移
  def auth_Check
    if !user_signed_in?
      redirect_to root_path
    end
  end

end
