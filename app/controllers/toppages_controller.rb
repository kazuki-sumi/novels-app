class ToppagesController < ApplicationController
  def index
    @novels = Novel.all.page(params[:page])
  end
end
