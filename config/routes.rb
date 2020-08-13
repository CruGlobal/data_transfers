Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  ActiveAdmin.routes(self)

  get "monitors/lb" => "monitors#lb"

  get "/sessions/new", to: "sessions#new"
  get "/auth/:provider/callback", to: "sessions#create"

  resources :users, only: [:index, :update, :destroy] do
    collection do
      get :no_access
    end
  end

  get "/logout", to: "sessions#destroy", as: :destroy_admin_user_session
  resource :sessions, only: %i[new create destroy]
  get "auth/oktaoauth/callback", to: "sessions#create"

  root to: "admin/entities#index"
end
