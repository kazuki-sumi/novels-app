class DraftsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :edit]
  
  #執筆中の小説一覧
  def index
    @novels = current_user.novels
  end
  
  def show
    @drafts = Draft.where(novel_id: params[:novel_id])
    @novel = Draft.find_by(novel_id: params[:novel_id])
  end
  
  def new
    @draft = Draft.new
  end
  
  def create
    @novel = Draft.where(novel_id: params[:novel_id])
    @draft = @novel.new(draft_params)
    if @draft.save
      flash[:success] = '保存しました。'
      redirect_to "/users/#{current_user.id}"
    else
      flash.now[:danger] = '保存に失敗しました。'
      render :new
    end
  end
  
  def edit
    @draft = Draft.find_by(novel_id: params[:novel_id], sequential_id: params[:sequential_id])
  end
  
  def update
    @drafts = Draft.find_by(novel_id: params[:novel_id], sequential_id: params[:sequential_id])
    if @drafts.update(draft_params)
      flash[:success] = '編集されました。'
      redirect_to "/users/#{current_user.id}"
    else
      flash.now[:danger] = '編集に失敗しました。'
      render :edit
    end
  end
  
  def destroy
    @draft = Draft.find_by(novel_id: params[:novel_id], sequential_id: params[:sequential_id])
    if @draft.destroy
      flash[:success] = '小説が削除されました。'
      redirect_to "/users/#{current_user.id}"
    else
      flash[:danger] = "削除に失敗しました。"
      render :back
    end
  end
  
  private
  
  def correct_user
    @draft = Draft.find_by(novel_id: params[:novel_id], sequential_id: params[:sequential_id])
    unless @draft.novel.user_id == current_user.id
      redirect_to root_url
    end
  end
  
  def draft_params
    params.require(:draft).permit(:subtitle, :preface, :postscript, :text)
  end
  
end

