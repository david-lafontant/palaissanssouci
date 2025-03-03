Rails.application.routes.draw do
  
  root "pages#index"
  get "about" => "pages#about", as: :about
  get "contact" => "pages#contact", as: :contact
  get "boutique" => "pages#boutique", as: :boutique
  get "department/:id" => "pages#department", as: :department
  get "details/:id" => "pages#details", as: :details
  get "blog" => "pages#blogs", as: :blogs
  get "blog/:id" => "pages#blog", as: :a_blog
  resources :products
  resources :categories
  resources :articles
  devise_for :users
  resources :orders
  resources :line_items
  resources :carts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
