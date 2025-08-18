class UsersController < ApplicationController

    def create
        user = User.new(username: params[:username], password: params[:password])
        if user.save
            render json: { message: 'User created successfully' }, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end
end