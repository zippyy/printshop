Printshop::Application.routes.draw do

  resources :products
  resources :cart_items

  get 'size_options' => 'cart_items#size_options'
  get 'finish_options' => 'cart_items#finish_options'
	get 'quantity_options' => 'cart_items#quantity_options'

end
