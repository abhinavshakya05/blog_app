Rails.application.routes.draw do
  root to: 'articles#index'

  devise_for :users, except: :create, path: '', path_names: { sign_in: 'login', sign_out: 'signed-out' }, :controllers => { registrations: 'registrations'}
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
