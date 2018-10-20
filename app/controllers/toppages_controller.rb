class ToppagesController < ApplicationController
  def index
    @novels = Novel.all.includes(:submit_novels).page(params[:page]).per(10)
    submit = Novel.joins(:drafts => :submit_novel).includes(:submit_novels).distinct(:novel_id)
    @submit = submit.select("drafts.novel_id AS novel_id, MAX(submit_novels.created_at) AS created_at").group(:novel_id).order("created_at DESC")
  end
end
