class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  before_action :current_user

  def create
    novel = Novel.find(params[:novel_id])
    current_user.fav(novel)
    flash[:success] = '小説をお気に入りに追加しました。'
    redirect_to :back
  end

  def destroy
    novel = Novel.find(params[:novel_id])
    current_user.unfav(novel)
    flash[:success] = '小説をお気に入りから削除しました。'
    redirect_to :back
  end
end
