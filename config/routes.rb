Rails.application.routes.draw do
  #get 'admin_panel/index'

  #get 'likes_streams/index'
match "/callback" => "facebook#callback" , method: :get
match "/facebook_profile" => "facebook#facebook_profile" , method: :get
root :to => 'facebook#index'
  
  resources :admin_panel
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
  
  #root to: 'qwatos#index'
end
