class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :devise_controller?


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
end
