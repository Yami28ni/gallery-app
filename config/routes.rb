Rails.application.routes.draw do
  root "albums#index"

  devise_for :users
  resources :albums do
    resources :photos, only: [:index, :new, :create] do 
      member do 
        delete :destroy_image
      end
    end
  end
 
  get "up" => "rails/health#show", as: :rails_health_check


end
