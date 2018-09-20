Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :projects
  resources :sessions, only: [:new, :create, :destroy]

  root 'projects#index'
end
