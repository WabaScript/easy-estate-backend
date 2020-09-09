class Api::V1::AuthController < ApplicationController
  def login
    user = User.find_by(email: params[:email])     

    if user && user.authenticate(params[:password])
      render json: user, include: [:comments, :listings, :followed_listings, :follow_listings => {:only => :created_at}]
    else
      render json: {errors: "Seriously? Try again"}
    end
  end    
    
  def auto_login
    user = User.find_by(id: request.headers["Authorization"])
      
    if user
        render json: user, include: [:comments, :listings, :followed_listings, :follow_listings => {:only => :created_at}]
    else 
        render json: {errors: "Woops, please login again!"}
    end    
  end

end