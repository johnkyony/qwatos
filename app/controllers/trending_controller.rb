class TrendingController < ApplicationController
  def index
     likes_count_id = Like.all.order(created_at: :asc).pluck(:qwato_id)
    qwato = Qwato.where(id: likes_count_id).pluck(:id)
    @qwatos = Qwato.where(id: qwato).shuffle
  end
end
