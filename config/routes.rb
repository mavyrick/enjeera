Rails.application.routes.draw do
  # get 'company_questions/new'
  #
  # get 'company_questions/edit'
  #
  # get 'company_questions/show'
  #
  # get 'company_questions/create'
  #
  # get 'company_questions/update'
  #
  # get 'company_questions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/auth/:provider/callback', to: 'sessions#oauth2'

  get 'auth/linkedin', as: :sign_in_with_linkedin
  get 'auth/linkedin/callback' => 'callbacks#linkedin'

  # delete '/companies/:company_id/application_questions/', to: 'application_questions#destroy', as: :test2
  #
  # delete '/companies/:company_id/applyings/destroy', to: 'applyings#destroy'
  #
  # delete '/companies/:company_id/applyings/', to: 'applyings#destroy'
  #
  # delete '/companies/:company_id/applyings/:id', to: 'applyings#destroy', as: :test

  post '/companies/:company_id/applyings/status_change/:id', to: 'applyings#status_change', as: :company_applyings_status_change
  get '/companies/application_status', to: 'companies#application_status', as: :application_status

  resources :users

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :company_users, only: [:new, :create]

  resources :company_sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :home

  resources :companies do
    resources :applyings do
      resources :accepted_applications
    end
    # resources :company_questions
    resources :application_questions do
      post :sort, on: :collection
    end
  end

  # get '/applying/:id' => 'applying#show'

  # get '/application_questions' => "application_questions#index"
  # patch '/application_questions' => "application_questions#create"
  # post '/application_question/new' => "application_questions#new"

  root 'home#index'
end
