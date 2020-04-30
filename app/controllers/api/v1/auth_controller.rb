class Api::V1::AuthController < ApplicationController

    def login
        user = User.find_by(email: params[:email])     

        if user && user.authenticate(params[:password])
          render json: user, include: [:comments, :listings, :followed_listings, :follow_listings => {:only => :created_at}]
        else
          render json: {errors: "Seriously?"}
        end
      end    
      
    def auto_login
          user = User.find_by(id: request.headers["Authorization"])
          
        if user
           render json: user
         else 
           render json: {errors: "Hey cool cat/kitten, are you sure that's you?"}
         end    
    end
end