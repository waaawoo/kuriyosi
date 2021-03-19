class TopsController < ApplicationController
  def index
    @items = Item.all
    @newsList = News.order(created_at: :DESC).last(5)
  end

  def show
    @item = Item.find(params[:id])
  end
end
