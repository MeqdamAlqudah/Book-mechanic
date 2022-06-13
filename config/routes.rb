Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do    
      resources :users
      resources :cars      
      resources :appointment
    end
  end

end
