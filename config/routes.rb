Printshop::Application.routes.draw do

  get "customers/index"
  get "customers/new"
  resources :prices
  resources :categories
  resources :products
  resources :cart_items
  resources :password_resets
  resources :users
  resources :sessions
  resources :promo_items

  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'ownerlogin' => 'sessions#new', as: 'ownerlogin'
  get 'signup' => 'users#new', as: 'signup'
  
  get 'size_options' => 'cart_items#size_options'
  get 'finish_options' => 'cart_items#finish_options'
	get 'quantity_options' => 'cart_items#quantity_options'
	get 'submit_options' => 'cart_items#submit_options'
  get 'product_type' => 'cart_items#product_type'

  get 'dashboard' => 'dashboard#index', as: 'dashboard'
  get 'services' => 'welcome#services', as: 'services'
  get 'about' => 'welcome#about', as: 'about'
  get 'welcome/index'
  root :to => 'welcome#index'

end
