Rails.application.routes.draw do
  devise_for :users

  resources :data_sets
  resources :tags
  resources :links

  get 'pages/about', as: 'about'

  root "data_sets#index"
end
