class NovelsController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:destroy, :edit]

  def search
    @novels = Novel.all.includes(:submit_novels).page(params[:page]).per(10)
    submit = Novel.joins(:drafts => :submit_novel).includes(:submit_novels).distinct(:novel_id)
    @submit = submit.select("drafts.novel_id AS novel_id, MAX(submit_novels.created_at) AS created_at").group(:novel_id).order("created_at DESC")
    @novels = @novels.where(['title Like ?', "%#{params[:q]}%"]) if params[:q].present?
  end

  def index
    @novel = Novel.find(params[:id])
    @submit = Novel.joins({:drafts => :submit_novel}).where(id: params[:id]).select(" submit_novels.*, drafts.sequential_id")
  end

  def show
    @novel = Novel.find(params[:id])
    @submit = Draft.find_by(novel_id: params[:id], sequential_id: params[:sequential_id])
  end

  def new
    @novel = Novel.new
  end

  def create
    @novel = current_user.novels.build(novel_params)
    if @novel.save
      flash[:success] = '新規作成しました。'
      redirect_to "/users/#{current_user.id}"
    else
      flash.now[:danger] = '新規の作成に失敗しました。'
      render :new
    end
  end

  def edit
    @novel = Novel.find(params[:id])
  end

  def update
    @novel = Novel.find(params[:id])
    if @novel.update(novel_params)
      flash[:success] = '編集されました。'
      redirect_to "/users/#{@novel.user_id}"
    else
      flash.now[:danger] = '編集に失敗しました。'
      render :edit
    end
  end

  def destroy
    @novel = Novel.find(params[:id])
    if @novel.destroy
      flash[:success] = '小説が削除されました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = '削除されませんでした。'
      render_to '/'
    end
  end

  private

  def novel_params
    params.require(:novel).permit(:summary, :title)
  end

  def correct_user
    @novel = current_user.novels.find_by(id: params[:id])
    unless @novel
      redirect_to root_url
    end
  end
end