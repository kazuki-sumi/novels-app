class RankingsController < ApplicationController
  def favorite
    @ranking_counts = Favorite.ranking
    @novels = Novel.find(@ranking_counts.keys).take(100)
  end
end
