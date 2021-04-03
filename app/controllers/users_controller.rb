class UsersController < ApplicationController
    skip_before_action :require_login, only: [:create]
    
    def create
        @user = User.create(username: params[:username], email: params[:email], password: params[:password], review_id: params[:review_id])
        if @user.valid?
            payload = {user_id: @user.id}
            token = encode_token(payload)
            render json: {user: @user, jwt: token}
        else
            render json: {error: @user.errors.full_messages}, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email, :review_id)
    end
end
