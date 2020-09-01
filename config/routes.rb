Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :restaurants do
    resources :menus do
      resources :categories
    end
    resources :dishes
  end

  resources :tables do
    resources :orders, only: [:index, :new, :create, :show, :edit, :update] do
      member do
        get :confirmation
      end
    end
  end

  resources :orders, only: [] do
    resources :dishes, only: :show
  end

  resources :tables
  get '/design', to: 'pages#design'

end
