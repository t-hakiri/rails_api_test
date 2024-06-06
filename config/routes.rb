Rails.application.routes.draw do
  resources :auth, :only => [:create, :destroy]
  # post 'login', to: 'auth#login'
  get 'logged_in_user', to: 'auth#logged_in_user'
  resources :users
  resources :treasure_box do
    member do
      post 'open'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
