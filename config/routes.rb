Rails.application.routes.draw do
  devise_for :users

  resources :data_sets
  resources :tags

  root "data_sets#index"
end
