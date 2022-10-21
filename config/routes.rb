Rails.application.routes.draw do
  devise_for :users, path: '/', path_names: {
    sign_in: 'login'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[new create]
      resources :likes, only: %i[new create]
    end
  end

  namespace :api do
    namespace :v1 do 
      resources :users, only: %i[index show] do
        resources :posts, only: %i[index show] do 
          resources :comments, only: %i[index new show]
        end
      end
    end
  end
end
