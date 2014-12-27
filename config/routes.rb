Rails.application.routes.draw do
  #get 'likes_streams/index'

  

  devise_for :users
  
  resources :qwatos

  resources :likes

  resources :artists do 
    resources :qwatos do
       resources :likes 
    resources :dislikes
    end
  end
 
  resources :users do
   resources :likes , :dislikes do
    resources :qwatos 
    
    end
  end
  
  root to: 'qwatos#index'
end
