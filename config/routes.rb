Rails.application.routes.draw do
  devise_for :users
  resources :users
 
  resources :qwatos do
   
    resources :likes 
    resources :dislikes
  end
  
  root to: 'qwatos#index'
end
