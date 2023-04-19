Rails.application.routes.draw do
  root 'articles#index'

  get 'users/new', to: 'users#new', as: :new_user
  post 'users', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'lk', to: 'users#lk'

  resources :articles do
    resources :comments
  end
end
