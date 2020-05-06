class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    
    def index
        users = User.all
        render json: users, methods: :uploaded_image
    end
        # GET /users/1
        def show
            if @user
                render json: @user, include: {comments: {}, listings: {methods: :uploaded_images}, followed_listings: {methods: :uploaded_images}, follow_listings: {:except => :updated_at}},
                methods: :uploaded_image
            else
                render json: { message: "User not found!" }
            end
        end
      
        # POST /users
        def create
          user = User.new(user_params)
      
          if user.save
            render json: user, status: :created
          else
            render json: {errors: "Check your information and try again"}, status: :unprocessable_entity
          end
        end
      
        # PATCH/PUT /users/1
        def update
          if UpdateUserService.new(@user, user_params).call
            render json: @user
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        end
      
        # DELETE /users/1
        def destroy
          @user.destroy
        end
      
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_user
            @user = User.find_by(id: params[:id])
          end

          def parse_image(base64_image)
            decoded_image = Base64.decode64(base64_image)
            # file = File.open(Base64.decode64(base64_image), encoding: 'ASCII-8BIT')
            return StringIO.new(decoded_image)
          end
      
          # Only allow a trusted parameter "white list" through.
          def user_params
            params.require(:user).permit( :first_name, :last_name, :email, :password, :pro_pic, :city, :state, :realtor, :image )
          end
      
end

           