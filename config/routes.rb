Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # get "up" => "rails/health#show", as: :rails_health_check
  # resources :books
  post '/login', to: 'sessions#create'
  resources :books
  resources :users, only: [:create]
 

  get '/my_books', to: 'books#my_books'

  # Defines the root path route ("/")
  # root "posts#index"

  resources :users do
    post 'upload_image', to: 'users#upload_image'
  end

end
