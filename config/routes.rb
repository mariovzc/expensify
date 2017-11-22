Rails.application.routes.draw do
  root 'dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :expenses, only: [:index, :show]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :expenses, only: [:index, :create, :update, :destroy]
    end
  end
end
