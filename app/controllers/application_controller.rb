class ApplicationController < ActionController::Base



  # ログイン時にitemindexへ飛ばす
  def after_sign_in_path_for(resource)
    if current_user
      items_path
    end
  end
end
