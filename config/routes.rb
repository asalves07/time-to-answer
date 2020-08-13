Rails.application.routes.draw do
  get 'users_backoffice/welcome'
  
  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    get 'subjet/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
    post 'answer', to: 'answer#question'
  end
  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
  end
  namespace :admins_backoffice do
    get 'welcome/index' #Dashboard
    resources :admins #Administradores
    resources :subjects #Assuntos
    resources :questions
  end
  devise_for :admins, skip: [:registrations]
  devise_for :users
  
  get 'inicio', to: 'site/welcome#index'

  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
