Rails.application.routes.draw do
  resources :cars do
    resources :maintenances, shallow: true, except: :edit  do
      resources :operations, shallow: true, except: :show
    end
    get 'operation_titles', on: :member
  end

  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
