class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # ControllerからHelperのメソッドを使用するための処理
    include SessionsHelper

    private

    # ログイン認証を確認するための処理
    def require_user_logged_in
      redirect_to login_url unless logged_in?
    end
end
