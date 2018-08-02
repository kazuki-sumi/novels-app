class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :destroy, :update]
  before_action :correct_user, only: [:destroy]
  
  def show
    @user = User.find(params[:id])
    @novels = @user.novels.order('created_at DESC').page(params[:page])
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
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_back 
    end
  end
  
  private
  
  def correct_user
      unless current_user == self
        redirect_to root_url
      end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation)
  end
end
