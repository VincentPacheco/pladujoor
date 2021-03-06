Rails.application.routes.draw do
  get 'qr_codes/new'
  get 'qr_codes/create'
  devise_for :users
  get 'basic-qr-code-reader', to: 'basic_qr_codes#index'
  root to: 'pages#home' do
  end
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

  resources :qr_codes, only: [:new, :create]

  get 'qr_codes', to: "qr_codes#new"

  resources :tables
  get '/design', to: 'pages#design'


end
