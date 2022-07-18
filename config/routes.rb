Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    passwords: "users/passwords"
  }
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  resources :projects do
    resources :tasks
  end
  root to: "projects#index"
end
