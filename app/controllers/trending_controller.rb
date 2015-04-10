class TrendingController < ApplicationController
  def index
     likes_count_id = Like.all.order(id: :desc).pluck(:qwato_id)
    qwato = find_by(id: likes_count_id)
    @qwatos = Qwato.all.order(id: likes_count_id)
  end
end
