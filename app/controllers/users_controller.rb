class UsersController < ApplicationController
    skip_before_action :require_login, only: [:create]
    
    def create
        @user = User.create(user_params)
        if user.valid?
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: @user, jwt: token}
        else
            render json: {error: @user.errors.full_messages}, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:users).permit(:username, :password, :email, :review_id)
    end
end
