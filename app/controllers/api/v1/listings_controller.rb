require 'open-uri'
class Api::V1::ListingsController < ApplicationController
    
    before_action :set_listings, only: [:update, :destroy]

    def index
        listings = Listing.all
        render json: listings.sort {|a, b| b.updated_at <=> a.updated_at}, 
            include: {owner: {methods: :uploaded_image}, comments: {include: {user: {methods: :uploaded_image}}}, followers: {}, follow_listings: {only: :created_at}},
            methods: [:createdFormat, :uploaded_images]
    end

    def show
        listing = Listing.find_by(id: params[:id])
        if listing
            render json: listing, include: {owner: {methods: :uploaded_image}, comments: {include: :user}, followers: {}, follow_listings: {:only => :created_at}},
            methods: [:createdFormat, :uploaded_images]
        else
            render json: { message: "Listing not found!" }
        end
    end
      
    # POST /listings
    def create
        listing = Listing.new(listing_params)
        #  params[:listing][:images].each_with_index {|image, i| listing.images.attach(io: File.new(image.sub!("file:", ""), "w"), filename: index.to_s + '_image.jpg', content_type: "image/jpg", identify: false)}
        params[:listing][:images].each_with_index {|image, index| listing.images.attach(io: parse_image(image), filename: index.to_s + '_image.jpg')}
        p listing
        if listing.save
        render json: listing, include: [:owner, :images], status: :created
        else
        render json: listing.errors, status: :unprocessable_entity
        end
    end
    
    # PATCH/PUT /listings/1
    def update
        if @listing.update(listing_params)
        # @listing.images.attach(params[:images])
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

    def parse_image(base64_image)
        decoded_image = Base64.decode64(base64_image)
        # file = File.open(Base64.decode64(base64_image), encoding: 'ASCII-8BIT')
        p StringIO.new(decoded_image)
        return StringIO.new(decoded_image)
    end
    
    # Only allow a trusted parameter "white list" through.
    def listing_params
    params.require(:listing).permit( :owner_id, :p_contact, :address, :city, :state, :zipcode, :neighborhood, :price, :features, :bed, :bath, :sqr_foot, :longitude, :latitude, :default_image => [])
    end

end