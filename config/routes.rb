Rails.application.routes.draw do
  get 'welcome', to:'welcome#index'

  get 'login', to: 'authorizations#create', as: :login
  get 'reset_password', to: 'authorizations#update', as: :reset_password #forgot_password
  get 'users/new', to: 'users#create', as: :users #new_registration

  resources :users

  resources :articles do
    resources :comments
    end
end
