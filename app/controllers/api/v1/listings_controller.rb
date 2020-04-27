class Api::V1::ListingsController < ApplicationController
    before_action :set_listings, only: [:update, :destroy]

    def index
        listings = Listing.all
        render json: listings, include: {owner: {}, comments: {include: :user}, followers: {}, follow_listings: {only: :created_at}}
    end

    def show
        listing = Listing.find_by(id: params[:id])
        if listing
            render json: listing, include: [:owner, :comments, :followers, :follow_listings => {:only => :created_at}]
        else
            render json: { message: "Listing not found!" }
        end
    end
      
    # POST /listings
    def create
        listing = Listing.new(listing_params)
    
        if listing.save
        render json: listing, status: :created
        else
        render json: listing.errors, status: :unprocessable_entity
        end
    end
    
    # PATCH/PUT /listings/1
    def update
        if @listing.update(listing_params)
        @listing.images.attach(params[:images])
        render json: @listing
        else
        render json: @listing.errors, status: :unprocessable_entity
        end
    end
    
    # DELETE /listings/1
    def destroy
        @listing.destroy
    end
    
        private
    # Use callbacks to share common setup or constraints between actions.
    def set_listings
    @listing = Listing.find_by(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def listing_params
    params.require(:listing).permit( :owner_id, :p_contact, :address, :city, :state, :zipcode, :neighborhood, :price, :features, :bed, :bath, :sqr_foot, :longitude, :latitude, :default_image => [])
    end

end