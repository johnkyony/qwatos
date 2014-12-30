Rails.application.routes.draw do
  #get 'admin_panel/index'

  #get 'likes_streams/index'

  
  resources :admin_panel
  devise_for :users , :controllers => {:omniauth_callbacks => "user/omniauth_callbacks"}

  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  
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
