Rails.application.routes.draw do
  root 'application#hello'
  resources :equipment
  match '/addequipment', to: 'equipment#new',		via: 'get'
end