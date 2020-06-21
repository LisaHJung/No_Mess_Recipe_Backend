class AuthenticationController < ApplicationController
    
    def login
        @user = User.find_by(username: params[:username])

        if @user

            if @user.authenticate(params[:password])
                token = createToken(@user)

                render json: {
                    token: token,
                    favorites: @user.favorites
                }
            else
                render json: {message: "Wrong username or password. Please try again."}, status: :unauthorized
            end
        else
            render json: {message: "Wrong username or password. Please try again."}, status: :unauthorized
        end
    end

end