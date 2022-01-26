Rails.application.routes.draw do
  get 'tasks/index'
  get 'tasks/new'
  get 'tasks/create'
  get 'tasks/show'
  get 'tasks/update'
  get 'tasks/destroy'
  devise_for :users
  resources :projects do
    resources :tasks
  end
  root to: "projects#index"
end
