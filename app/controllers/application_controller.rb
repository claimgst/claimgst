require 'jwt'

class ApplicationController < ActionController::API
  before_action :authenticate_user_from_token!

  respond_to :json

  ## 
  # User Authentication
  # Authenticates the user with OAuth2 Resource Owner Password Credentials Grant
  def authenticate_user_from_token!
    auth_token = request.headers['Authorization']

    if auth_token
      authenticate_with_auth_token auth_token
    # else
    #   authentication_error
    end
  end

  private

  def authenticate_with_auth_token auth_token 
    unless auth_token.include?('.')
      authentication_error
      return
    end

    begin
      decoded_token = JWT.decode auth_token, nil, false
    rescue JWT::VerificationError
      authentication_error
    else
      # Build user object from token
      auth_user_data = decoded_token.first
      auth_user = User.new auth_user_data

      if auth_user
        # User can access
        sign_in user, store: false
      else
        authentication_error
      end
    end
  end

  ## 
  # Authentication Failure
  # Renders a 401 error
  def authentication_error
    # User's token is either invalid or not in the right format
    render json: {error: 'unauthorized'}, status: 401  # Authentication timeout
  end
end
