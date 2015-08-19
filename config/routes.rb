Rails.application.routes.draw do

  root 							          'static_pages#home'
  get   	 'contact' 		  =>  'static_pages#contact'
  get		   'addequipment'	=>	'equipment#new'
  get      'makerequest'  =>  'requests#new'
  get		   'signup' 		  =>	'admins#new'
  get		   'login'			  =>	'sessions#new'
  post		 'login'			  =>	'sessions#create'
  delete	 'logout'		    =>	'sessions#destroy'
  resources :admins do
    member do
      get :signed_out, :signed_out_by
    end
  end
  resources :equipment
  resources :requests
  resources :sign_outs,   only: [:create, :destroy]
end