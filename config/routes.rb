Rails.application.routes.draw do
  get 'company_questions/new'

  get 'company_questions/edit'

  get 'company_questions/show'

  get 'company_questions/create'

  get 'company_questions/update'

  get 'company_questions/destroy'

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
  resources :applyings, only: [:new, :create, :destroy, :index]
  # resources :company_questions
  resources :application_questions do
    post :sort, on: :collection
  end
end

# get '/applying/:id' => 'applying#show'

# get '/application_questions' => "application_questions#index"
# patch '/application_questions' => "application_questions#create"
# post '/application_question/new' => "application_questions#new"

root "home#index"

end
