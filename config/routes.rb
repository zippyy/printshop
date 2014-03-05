Printshop::Application.routes.draw do

  get "prices/new"
  get "prices/index"
  resources :categories
  resources :products
  resources :cart_items

  get 'size_options' => 'cart_items#size_options'
  get 'finish_options' => 'cart_items#finish_options'
	get 'quantity_options' => 'cart_items#quantity_options'
	get 'submit_options' => 'cart_items#submit_options'

end
