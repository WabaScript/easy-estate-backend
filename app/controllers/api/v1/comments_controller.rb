class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: [ :update, :destroy]
  
  # GET /comments
  def index
    comments = Comment.all
    render json: comments
  end

  # GET /comments/1
  def show
    comment = Comment.find_by(id: params[:id])
    render json: comment, include: {user: {methods: :uploaded_image}}
  end

  # POST /comments
  def create
    comment = Comment.new(comment_params)
    
    if comment.save
      render json: comment, include: {user: {methods: :uploaded_image}}
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if comment.update(comment_params)
      render json: comment
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      comment = Comment.find_by(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit( :user_id, :listing_id, :content )
    end

end