Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  ActiveAdmin.routes(self)

  get "monitors/lb" => "monitors#lb"

  get "/logout", to: "sessions#destroy", as: :destroy_admin_user_session
  get "/auth/:provider/callback", to: "sessions#create"
  resource :session, only: %i[new create destroy]

  resources :users, only: [:index, :update, :destroy] do
    collection do
      get :no_access
    end
  end

  root to: "admin/entities#index"
end
