BookShop::Application.routes.draw do

  root 'welcome#index'

  get "cart/add_product/:product_id" => "cart#add_product", as: :add_product
  get "cart/remove_product/:product_id" => "cart#remove_product", as: :remove_product
  get "/categories/:key" => "welcome#index", as: :categories

  post "search" => "welcome#index", as: :search

  devise_for :administrators
  devise_for :users

  namespace :admin do
    root "dashboard#index"
    resources :categories
    resources :products
  end

  ##
  # http://api.localhost
  #
  constraints subdomain: "api" do
    namespace :api, path: "/" do
      resources :products, only: [:index, :show]
    end
  end









end
