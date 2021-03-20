class ApplicationController < ActionController::Base
  # deviseコントローラーを呼んだ時に実行
  before_action :basic_auth#, if: :devise_controller?
  before_action :basic_auth, if: :devise_controller?
  before_action :storeId


  private
  # ログイン時にitemindexへ飛ばす
  def after_sign_in_path_for(resource)
    if current_user
      items_path
    end
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # 環境変数が指定される
      # vim ~/.zshrc
      # source ~/.zshrc
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  # 管理者以外はルートぱすへ遷移
  def auth_Check
    if !user_signed_in?
      redirect_to root_path
    end
  end

  def storeId
    @storeTOP = Store.first
  end
end
