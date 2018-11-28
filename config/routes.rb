Rails.application.routes.draw do
  resources :users
  resources :items
  get '/auth/facebook/callback' => 'sessions#create'  
  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
