require "tumblr_client"
class TumblrSessionsController < ApplicationController
    def connect
        redirect_to Tumblr.authorize_url(:redirect_uri => CALLBACK_URL)
    end
    def callback
        response = Tumblr.get_access_token(params[:code] , :redirect_uri => CALLBACK_URL)
        session[:access_token] = response.access_token
        redirect_to :controller => 'admin_panel' , :action => 'index'
        
        
    end
end
