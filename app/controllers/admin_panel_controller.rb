class AdminPanelController < ApplicationController
  def index
    @artist = Artist.all
  end
end
