Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :users, only: [:new, :create]

resources :sessions, only: [:new, :create] do
   delete :destroy, on: :collection
 end

resources :home

resources :companies

root "home#index"

end
