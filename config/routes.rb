Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :bills, only: [:new, :index, :create, :destroy]
    end
  end
end
