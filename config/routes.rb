Rails.application.routes.draw do
  get "contact", to: "messages#new", as: "contact"
  post "contact", to: "messages#create"

  resources :programs, only: [:index, :show]
  resources :categories, only: [:index, :show]

  root "programs#index"
end
