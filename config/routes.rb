Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :menus do
      resources :categories
    end
    resources :tables do
      resources :orders
    end
    resources :dishes
  end
  resources :orders, only: [] do 
    member :confirmation
  end
end
