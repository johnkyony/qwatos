class DislikesController < ApplicationController
  def create
    if current_user 
      @qwato = Qwato.find_by_id(params[:qwato_id])
      if @qwato && !current_user.disliked_before?(@qwato) && !current_user.liked_before?(@qwato)
        @qwato.dislikes.create({user_id: current_user.id})
         flash[:notice] = "Qwato has been disliked : #{@qwato.dislikes.count}"
         redirect_to qwatos_path     
      else
        #render js: 'alert(\'You have like this before\');'
       flash[:success] = 'qwatos has been disliked already'
        redirect_to qwatos_path
      end
      
    else
      #flash[:warning] = 'you have liked this qwatos before'
     # redirect_to qwatos_path
      #render js:  'alert(\'Your like cannot be saved.\');'
    end
    
  end
end
