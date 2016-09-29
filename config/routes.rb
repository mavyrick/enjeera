Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :users, only: [:new, :create]

resources :sessions, only: [:new, :create] do
  delete :destroy, on: :collection
end

resources :company_users, only: [:new, :create]

resources :company_sessions, only: [:new, :create] do
  delete :destroy, on: :collection
end



resources :home

resources :companies do
  resources :applyings, only: [:new, :create, :destroy]
  #resources :application_questions, only: [:new, :create, :destroy]
end
get '/application_questions' => "application_questions#index"
patch '/application_questions' => "application_questions#create"

root "home#index"

end
