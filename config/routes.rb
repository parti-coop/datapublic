Rails.application.routes.draw do
  resources :posts
  constraints(subdomain: /.+/) do
    get '/', to: redirect { |parmas, req| "#{req.protocol}#{Rails.application.routes.default_url_options[:host]}/archives/#{Archive.find_by(slug: req.subdomain).try(:id)}" }
  end

  devise_for :users

  resources :archives
  resources :data_sets
  resources :tags
  resources :links

  get 'pages/about', as: 'about'

  root "pages#home"
end
