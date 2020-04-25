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

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
