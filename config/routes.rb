Rails.application.routes.draw do
  get 'tables/index'
  get 'tables/show'
  get 'tables/new'
  get 'tables/create'
  get 'tables/update'
  get 'tables/destroy'
  get 'categories/index'
  get 'categories/show'
  get 'categories/new'
  get 'categories/create'
  get 'categories/update'
  get 'categories/destroy'
  get 'dishes/index'
  get 'dishes/show'
  get 'dishes/new'
  get 'dishes/create'
  get 'dishes/update'
  get 'dishes/destroy'
  get 'menus/index'
  get 'menus/show'
  get 'menus/new'
  get 'menus/create'
  get 'menus/update'
  get 'menus/destroy'
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'orders/create'
  get 'orders/update'
  get 'orders/destroy'
  get 'restaurants/index'
  get 'restaurants/show'
  get 'restaurants/new'
  get 'restaurants/create'
  get 'restaurants/update'
  get 'restaurants/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :dishes
    resources :menus
    resources :orders
    resources :customers do
      resources :orders
    end
  end

  resources :orders

  resources :tables

end
