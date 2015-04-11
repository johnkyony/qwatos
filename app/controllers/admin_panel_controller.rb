class AdminPanelController < ApplicationController
  before_filter :authenticate_user!
  def index
    redirect_to :controller => 'sessions', :action => 'connect' if !session[:access_token] 
    @artist = Artist.all
    # code for the hashtag view on tumblr
    client = Tumblr::Client.new

    @artist_qwato_pool = client.posts( :tags => "drake",:type => "photo" , :limit => 20)
  end
end
