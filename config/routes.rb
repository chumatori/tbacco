Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  root 'articles#index'

  get 'users/new', to: 'users#new', as: :new_user
  post 'users', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'lk', to: 'users#lk'

  resources :articles do
    member do
      put :like
      put :dislike
    end
    resources :comments
    resources :reactions, only: %i[create]
  end

  namespace :api do
    namespace :v1 do
      resources :articles
    end
  end

  get  'reset_password', to: 'reset_password#new'
  post 'reset_password', to: 'reset_password#update'

  get  'forgot_password', to: 'forgot_password#new'
  post 'forgot_password', to: 'forgot_password#edit'

  post 'api/auth', to: 'api/auth#login'
end
