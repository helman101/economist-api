Rails.application.routes.draw do
  resources :users, only: [ :create ]
  get 'auth', to: 'users#auth'
end
