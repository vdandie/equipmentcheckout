Rails.application.routes.draw do
  root 'application#hello'
  resources :equipment
  resources :admins
  match '/addequipment', 	to: 'equipment#new',		via: 'get'
  match '/signup', 			to: 'admin#new',			via: 'get' 
end