class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :destroy, :update, :followings, :followers]
  before_action :correct_user, only: [:destroy, :edit]
  
  def show
    @user = User.find(params[:id])
    @novels = Novel.posted_novels(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザ登録しました。'
      redirect_to user_url(@user)
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'ユーザ情報は削除されました。'
    redirect_to '/'
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_back 
    end
  end
 
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
    counts(@user)
  end
  
  private
  
  def counts(user)
    @count_followings = user.followings.count
    @count_followers = user.followers.count
  end

  def correct_user
    unless current_user
      redirect_to root_url
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation)
  end
end
