Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users

  resources :matches
  resources :set_lists, only: [:create, :destroy]
  get '/matches/:mid/new_set_list', to: 'set_lists#new'
  resources :ban_lists, only: [:create, :destroy]
  get '/matches/:mid/new_ban_list', to: 'ban_lists#new'
end
