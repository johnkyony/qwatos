class LikesStreamController < ApplicationController
  
  def index
   
  

  end
  private
  def set_user_id
    @user_id = User.where(id: current_user.id)
    
  end

end
