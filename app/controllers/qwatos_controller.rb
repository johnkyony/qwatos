class QwatosController < ApplicationController
  
 
  def index
    likes_count_id = Like.all.order("Desc").pluck(:qwato_id)
    @qwatos = Qwato.where(id: likes_count_id)
    
  end

  
  def show
    @qwato = Qwato.find(qwatos_params)
    
  end
   def new
    @qwato = Qwato.new
    
  end

  def create 
    @qwato = Qwato.create(qwatos_params)
    if @qwato.save
      flash[:notice] = "The qwato has been saved"
      redirect_to admin_panel_index_path
      
    else
      flash[:alert] = "The qwato not been created"
      render "new"
    end
    
  end


  private

def qwatos_params
  params.require(:qwato).permit(:quote , :image_url , :uploaded_at )
   
 end 




end
