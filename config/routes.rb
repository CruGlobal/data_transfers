Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ActiveAdmin.routes(self)

  get "monitors/lb" => "monitors#lb"

  get "/auth/:provider/callback", to: "sessions#create"

  resources :users, only: [:index, :update, :destroy] do
    collection do
      get :no_access
    end
  end

  get "/logout", to: "sessions#destroy", as: :destroy_admin_user_session

  root to: "admin/entities#index"
end
