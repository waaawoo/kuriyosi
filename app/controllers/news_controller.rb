class NewsController < ApplicationController
  before_action :auth_Check, only: [:new, :create, :edit, :upadate, :destroy]

  def index
    @newsList = News.order(created_at: :DESC)
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    if @news.save
      redirect_to items_path, notice: "登録に成功しました"
    else
      render :new
    end
  end

  def show
    @news = News.find(params[:id])
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update(news_params)
      redirect_to items_path, notice: "編集に成功しました"
    else
      render :edit
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    redirect_to items_path, notice: "正常に削除されました"
  end

  private
   # 管理者以外はルートぱすへ遷移
   def auth_Check
    if !user_signed_in?
      redirect_to root_path
    end
  end

  def news_params
    params.require(:news).permit(
      :title,
      :content,
      :image
    ).merge(user_id: current_user.id)
  end
end
