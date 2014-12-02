class QwatosController < ApplicationController
  def index
    @qwatos = Qwato.all
    @likes = Like.all
  end



  private

def qwatos_params
  params.require(:qwato).permit(:quote , :image_url , :uploaded_at )
   
 end 

end
