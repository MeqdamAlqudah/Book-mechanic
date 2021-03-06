Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: { sessions: "users/sessions",  users: "users" }

  namespace :api do
    namespace :v1 do
      resources :users do
      resources :cars do
        collection { post :create, via: :options }
      end
      resources :appointment

    end
    end
  end
end
