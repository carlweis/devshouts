Rails.application.routes.draw do

  get 'users/show'

  root to: "static_pages#home"

  # static pages
  get "help"    => "static_pages#help"
  get "about"   => "static_pages#about"
  get "contact" => "static_pages#contact"

  # signup / sign in
  get "signup"  => 'registrations#new'

  # users
  resources :users, only: [:show]
end
