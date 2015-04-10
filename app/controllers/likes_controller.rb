class LikesController < ApplicationController
  def create
    if current_user 
      @qwato = Qwato.find_by_id(params[:qwato_id])
      if @qwato && !current_user.liked_before?(@qwato) && !current_user.disliked_before?(@qwato)
        @qwato.likes.create({user_id: current_user.id})
         flash[:notice] = "Qwato has been liked : #{@qwato.likes.count}"
         redirect_to qwatos_path     
      else
        #render js: 'alert(\'You have like this before\');'
       flash[:success] = 'qwatos has been liked already'
        redirect_to qwatos_path
      end
      
    else
      flash[:warning] = 'you have liked this qwatos before'
      redirect_to qwatos_path
      #render js:  'alert(\'Your like cannot be saved.\');'
    end
    
  end
  def index
    user = User.find_by_id(params[:user_id])
    likes = Like.where(user_id: user).pluck(:qwato_id)
    @qwatos = Qwato.where(id: likes)
  end
  
  def show
    likes_count_id = Like.all.order(id: :desc).pluck(:qwato_id)
    qwato = find_by(id: likes_count_id)
    @qwatos = Qwato.all.order(id: likes_count_id)
  end

end