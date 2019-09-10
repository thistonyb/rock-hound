Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  
  resources :rocks do
    resources :comments
  end

  get '/home' => 'users#home'

  get '/collection' => 'rocks#collection'

  get '/login' => 'sessions#login'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  root 'welcome#home'

  get '/auth/facebook/callback' => 'sessions#facebook_create'
end
