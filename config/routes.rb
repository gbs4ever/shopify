Rails.application.routes.draw do
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'
   get "/home", to: 'api#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
