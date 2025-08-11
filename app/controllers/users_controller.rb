class UsersController < ApplicationController

    def create
        @user = User.new(username: params[:username], password: params[:password])
        if user.save
            render json: { message: 'User created successfully' }, status: :created
        else
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def upload_image
    user = User.find(params[:user_id])

    if user.image.attach(params[:image])
      render json: { message: "Image uploaded" }, status: :ok

    else
      render json: { message: "Image upload failed" }, status: :unprocessable_entity
    end


end
end