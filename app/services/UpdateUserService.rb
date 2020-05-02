class UpdateUserService
    def initialize(user, params)
      @user = user
      @params = params
    end
  
    def call
      if @params[:image] && !file?(@params[:image])
        delete_image if @user.image.attached?
        @params.delete(:image)
      end
  
      @user.update(@params)
    end
  
    private
  
    def file?(param)
      param.is_a?(ActionDispatch::Http::UploadedFile)
    end
  
    def delete_image
      @user.image.purge
    end
  end