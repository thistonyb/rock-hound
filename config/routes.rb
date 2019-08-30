Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resources :comments
  resources :rocks

  get '/home' => 'users#home'

  get '/login' => 'sessions#login'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root 'welcome#home'
end
