class RankingsController < ApplicationController
  def favorite
    @ranking_counts = Favorite.ranking
    @novels = Novel.find(@ranking_counts.keys)
  end
end
