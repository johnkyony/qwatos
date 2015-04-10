Rails.application.routes.draw do
  #get 'admin_panel/index'

  #get 'likes_streams/index'

  
  resources :admin_panel
  devise_for :users , :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  
  
  resources :qwatos do
    resources :likes
    resources :dislikes

  end

  resources :likes
  

  resources :artists do 
    resources :qwatos       
  end
 
  resources :users do
   resources :likes , :dislikes  
    
    
  end
  
  root to: 'qwatos#index'
end
