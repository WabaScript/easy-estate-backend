class Api::V1::FollowListingsController < ApplicationController
  before_action :set_follow_listing, only: [:show, :update, :destroy]

  # Index of Joins
  def index
    follow_listings = FollowListing.all
    render json: follow_listings, include: [:follower, :followed_listings]
  end

  # Index of all listings users are following
  def followed_listings_index
    follow_listings = FollowListing.all
    render json: follow_listings, except: [:follower_id, :listing_id, :updated_at], include: :followed_listings
  end

  # Index of all users that are following listings
  def follower_index
      follow_listings = FollowListing.all
      render json: follow_listings, include: :follower
  end

  # GET /follow_listings/1
  def show
    render json: @follow_listing
  end

  # POST /follow_listings
  def create
    follow_listing = FollowListing.new(follow_listing_params)

    if follow_listing.save
      render json: follow_listing, status: :created
    else
      render json: follow_listing.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /follow_listings/1
  def update
    if @follow_listing.update(follow_listing_params)
      render json: @follow_listing
    else
      render json: @follow_listing.errors, status: :unprocessable_entity
    end
  end

  # DELETE /follow_listings/1
  def destroy
    @follow_listing.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_follow_listing
    @follow_listing = FollowListing.find_by(id: params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def follow_listing_params
    params.require(:follow_listing).permit( :follower_id, :listing_id )
  end

end
