Rails.application.routes.draw do
  root "programs#index"

  resources :programs, only: [:index, :show]
end
