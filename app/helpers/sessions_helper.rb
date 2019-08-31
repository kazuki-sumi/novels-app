module SessionsHelper
  # ログイン中のユーザを取得
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # ログインをしているかいないかを判断
  def logged_in?
    !!current_user
  end
end
