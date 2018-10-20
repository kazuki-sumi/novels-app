class SubmitNovelsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :edit]
  
  def index
    @submit = User.joins(:novels => {:drafts => :submit_novel}).select(:novel_id).distinct.where('users.id = ?', params[:user_id]).select("novels.id AS novel_id, novels.title")
  end
  
  def show
    @novel = Novel.find(params[:novel_id])  
    @submit = Novel.joins(:drafts => :submit_novel).where(id: params[:novel_id]).select("submit_novels.*, novels.id AS novel_id, drafts.sequential_id")
  end
  
  def new
    @draft = Draft.find_by(novel_id: params[:novel_id], sequential_id: params[:sequential_id])
    @submit = SubmitNovel.new
  end
  
  def create
    @draft = Draft.find_by(novel_id: params[:novel_id], sequential_id: params[:sequential_id])
    @submit = @draft.build_submit_novel(submit_novel_params)
    if @submit.save
      flash[:success] = '投稿されました。'
      redirect_to "/users/#{current_user.id}"
    else
      flash[:danger] = '投稿に失敗しました。'
      render :new
    end
  end
  
  def edit
    @submit = SubmitNovel.find(params[:id])
  end
  
  def update
    @submit = SubmitNovel.find(params[:id])
    if @submit.update(submit_novel_params)
      flash[:success] = '修正され、再投稿しました。'
      redirect_to "/users/#{current_user.id}"
    else
      flash[:danger] = '修正されませんでした。'
      render :back
    end
  end
    
  def destroy
    @submit = SubmitNovel.find(params[:id])
    if @submit.destroy
      flash[:success] = '削除されました。'
      redirect_to "/users/#{current_user.id}"
    else
      flash[:danger] = '削除されませんでした。'
      render :back
    end
  end
  
  private
  
  def correct_user
    @submit = SubmitNovel.find(params[:id]).novel.user_id
    unless @submit == current_user.id
      redirect_to root_url
    end
  end
  
  def submit_novel_params
    params.require(:submit_novel).permit(:subtitle, :preface, :postscript, :text)
  end
  
end
