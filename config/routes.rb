Rails.application.routes.draw do
  root 'articles#index'

  get 'users/new', to: 'users#new', as: :new_user
  post 'users', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'lk', to: 'users#lk'

  resources :articles do
    resources :comments
  end

  namespace :api do
    namespace :v1 do
      resources :articles
    end
  end
  post 'api/auth', to: 'api/auth#login'
end
