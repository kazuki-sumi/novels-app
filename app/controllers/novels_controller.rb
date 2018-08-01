class NovelsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:destroy, :edit]
  
  
  def index
    @novels = Novel.all.order('created_at DESC').page(params[:page])
    @novels = @novels.where(['title Like ?', "%#{params[:q]}%"]) if params[:q].present?
  end

  def show
    @novel = Novel.find(params[:id])
  end

  def new
    @novel = Novel.new
  end

  def create
    @novel = current_user.novels.build(novel_params)
    if @novel.save
      flash[:success] = '小説を投稿しました。'
      redirect_to novels_path
    else
      flash.now[:danger] = '小説の投稿に失敗しました。'
      render :new
    end
  end
  
  def edit
    @novel = Novel.find(params[:id])
  end
  
  def update
    @novel = Novel.find(params[:id])
    
    if @novel.update(novel_params)
      flash[:success] = '小説は編集されました。'
      redirect_to "/users/#{@novel.user_id}"
    else
      flash.now[:danger] = '小説は更新されませんでした。'
      render :edit
    end
  end
  
  def destroy
    @novel = Novel.find(params[:id])
    @novel.destroy
    flash[:success] = '小説を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def novel_params
    params.require(:novel).permit(:sentence, :title)
  end
  
  def correct_user
    @novel = current_user.novels.find_by(id: params[:id])
    unless @novel
      redirect_to root_url
    end
  end
  
end
