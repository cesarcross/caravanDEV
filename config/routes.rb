Rails.application.routes.draw do
  get 'contact/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :contacts, only: %i[new create]
  resources :pages, only: %i[new create]
end
