class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    # ControllerからHelperのメソッドを使用するための処理
    include SessionsHelper
    
    def counts(user)
      @count_followings = user.followings.count
      @count_followers = user.followers.count
    end
    
    private
    
    # ログイン認証を確認するための処理
    def require_user_logged_in
      unless logged_in?
        redirect_to login_url
      end
    end
    
end
