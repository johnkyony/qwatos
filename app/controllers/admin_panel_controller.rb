class AdminPanelController < ApplicationController
  before_filter :authenticate_user!
  def index
    @artist = Artist.all
  end
end
