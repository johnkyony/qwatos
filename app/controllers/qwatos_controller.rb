class QwatosController < ApplicationController
 
  def index
    @qwatos = Qwato.all
    
  end

  



  private

def qwatos_params
  params.require(:qwato).permit(:quote , :image_url , :uploaded_at )
   
 end 




end
