class QwatosController < ApplicationController
  def index
    @qwatos = Qwato.all
    
  end

  def show
     @user = User.find(params[:user_id])
    @likes = Like.find(params[:qwato_id]).where(user_id: @user)
    @qwato = Qwato.find(params[:id]).where(id: @likes)
    
  end



  private

def qwatos_params
  params.require(:qwato).permit(:quote , :image_url , :uploaded_at )
   
 end 

end
