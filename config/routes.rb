Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  get 'pages/home'
end
