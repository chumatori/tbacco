Rails.application.routes.draw do
  get '/articles', to:'articles#show'
end
