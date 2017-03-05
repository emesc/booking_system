Rails.application.routes.draw do
  root "programs#index"

  resources :programs, only: [:index, :show]
  resources :categories, only: [:index, :show]
end
