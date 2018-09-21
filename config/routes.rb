Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :projects do
    resources :messages, except: [:index, :new, :show]
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :categories, only: [:show, :create]
  root 'projects#index'
end
