Rails.application.routes.draw do
  get 'requests/new'

  get 'requests/create'

  get 'requests/show'

  get 'requests/index'

  get 'requests/edit'

  get 'requests/destroy'

  root 							'static_pages#home'
  get   	'contact' 		=> 'static_pages#contact'
  get		'addequipment'	=>	'equipment#new'
  get		'signup' 		=>	'admins#new'
  get		'login'			=>	'sessions#new'
  post		'login'			=>	'sessions#create'
  delete	'logout'		=>	'sessions#destroy'
  resources :equipment
  resources :admins
end