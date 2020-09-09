Rails.application.routes.draw do
  resources :listing_image_bins
  namespace :api do
    namespace :v1 do 
      resources :comments
      resources :follow_listings
      resources :listings
      resources :users
    end
  end

  # custom routes 
  get '/followedlistings' => 'api/v1/follow_listings#followed_listings_index'
  get '/followers' => 'api/v1/follow_listings#follower_index'
  get 'listings/:id' => 'api/v1/listings#show'

  post "/signup", to: "api/v1/users#create"
  post "/login", to: "api/v1/auth#login"  
  get "/auto_login", to: "api/v1/auth#auto_login"

  # ActiveStorage
  default_url_options :host => "localhost:3000"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
