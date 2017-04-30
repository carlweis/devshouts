Rails.application.routes.draw do
  root to: "static_pages#home"

  # static pages
  get "help"    => "static_pages#help"
  get "about"   => "static_pages#about"
  get "contact" => "static_pages#contact"
end
