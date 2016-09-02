require 'jwt'

class Users::SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user_from_token!

  # POST /users/login
  def create
    @user = User.find_for_database_authentication(email: params[:email])
    return invalid_login_attempt unless @user

    if @user.valid_password?(params[:password])
      sign_in :user, @user

      hmac_secret = 'my$ecretK3y'
      token = JWT.encode JSON.parse(@user.to_json), hmac_secret, 'HS256'

      render json: token
    else
      invalid_login_attempt
    end
  end

  private

  def invalid_login_attempt
    warden.custom_failure!
    render json: {error: 'invalid_login_attempt'}, status: :unprocessable_entity
  end
end