class AdminPanelController < ApplicationController
  before_filter :authenticate_user!
  def index
    # redirect_to :controller => 'sessions', :action => 'connect' if !session[:access_token] 
    @artist = Artist.all
    # code for the hashtag view on tumblr
    client = Tumblr::Client.new({
        :consumer_key => 'LdyvjSqikz1dpZdt73FzYssRpsyHIr6IwER4KMv8STB9A8eFBD',
        :consumer_secret => 'nJCPWEEUATPFVpp34iPVcSMxIOwLs7zXU6YiCulD9MLlL0vfZt',
        :oauth_token => '99BY5QP8ARK1KSCn6e0A5sEcnW7qA821t49N0i5I10xHWdfiKY',
        :oauth_token_secret => '44n5psrzAAWbtgKjJVLISsRE2wD9ainxCyR8Kli0NGwpAPpAd4'
      })


    @artist_qwato_pool = client.posts("drake", :type => "photo")
     @artist_qwato_pool = @artist_qwato_pool["posts"]
  end
end
