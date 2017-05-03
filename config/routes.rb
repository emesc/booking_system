Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: "admin/sessions" }

  namespace :admin do
    resources :programs, :categories, :school_levels, :users, :roles
  end

  get "contact", to: "messages#new", as: "contact"
  post "contact", to: "messages#create"

  resources :bookings
  resources :programs, only: [:index, :show]
  resources :categories, only: [:show]
  resources :school_levels, only: [:show]
  
  root "programs#index"

  get "*path", to: "route_glob#index"
end
