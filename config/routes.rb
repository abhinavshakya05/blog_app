Rails.application.routes.draw do
  get 'home/index'
  get 'home/dashboard'
  
  resources :articles do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
