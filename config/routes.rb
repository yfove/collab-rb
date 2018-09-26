Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :projects do
    resources :messages, except: [:index, :new, :show]
    get "/applicants" => "projects#applicants", as: "applicants"
    post "/applicant" => "projects#create_applicant", as: "applicant"
    put "/applicant" => "projects#update_applicant", as: "update_applicant"
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :categories, only: [:show, :create]
  root 'welcome#index'
end
