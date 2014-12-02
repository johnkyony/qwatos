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
        if current_user.liked_before?(@qwato)
          flash[:success] = 'qwatos has been liked already'
        redirect_to qwatos_path
        else
          flash[:success] = 'qwatos has been disliked already'
        redirect_to qwatos_path
        end

       
      end
      
    else
      #flash[:warning] = 'you have liked this qwatos before'
     # redirect_to qwatos_path
      #render js:  'alert(\'Your like cannot be saved.\');'
    end
    
  end
  def show
    
    @qwato = current_user.id.likes.find(params[:user_id])
    redirect_to user_like_path
   
    
  end
  private
  

end
