Rails.application.routes.draw do
  root 'dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :expenses, only: [:index, :show]

  get 'chart/categories', to: 'dashboard#by_category', defaults: {format: :json}
  get 'chart/transaction', to: 'dashboard#last_6_months', defaults: {format: :json}
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :expenses, only: [:index, :create, :update, :destroy]
    end
  end
end
