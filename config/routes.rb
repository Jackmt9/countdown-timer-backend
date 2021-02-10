Rails.application.routes.draw do
  resources :timers
  resources :users, only: [:create]

  get '/stay_logged_in', to: 'users#stay_logged_in'
  post '/login', to: 'users#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
