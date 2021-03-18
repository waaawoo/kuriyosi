class NewsController < ApplicationController
  before_action :auth_Check, only: [:new, :create, :upadate, :destroy]
  def index

  end

  def new
    @news = News.new
  end

  private
   # 管理者以外はルートぱすへ遷移
   def auth_Check
    if !user_signed_in?
      redirect_to root_path
    end
  end
end
