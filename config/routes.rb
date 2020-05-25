Rails.application.routes.draw do
  devise_for :users

  resources :archives
  resources :data_sets
  resources :tags
  resources :links

  get 'pages/about', as: 'about'

  root "pages#home"
end
