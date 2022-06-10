Rails.application.routes.draw do
  scope 'api/v1' do
    resources :users do
      resources :cars
      resources :appointment
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
