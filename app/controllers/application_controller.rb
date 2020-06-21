class ApplicationController < ActionController::API

    def authenticate
        authorization_header = request.headers["Authorization"]

        if authorization_header
            token = authorization_header.split(" ")[1]
            begin
                secret = Rails.application.secrets.secret_key_base
                decoded_token = JWT.decode(token, secret)
                payload = decoded_token[0]
                @user_id = payload["user_id"]
            rescue
                render json: {message: "Wrong username or password. Please try again."}, status: :unauthorized
            end
        else
            render json: {message: "Wrong username or password. Please try again."}, status: :unauthorized
        end
    end

    def createToken(user)
        payload = { user_id: user.id }
        secret = Rails.application.secrets.secret_key_base
        JWT.encode(payload, secret)
    end

end