# frozen_string_literal: true

class Api::V1::Users::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session

  respond_to :json

  private

  def respond_with(_resource, _options = {})
    render json: {
      status: { code: 200, message: 'Signed in successfully.',
                data: current_user }
    }
  end

  def respond_to_on_destroy
    jwt_payload = request.headers['Authorization'].split(' ')[1], ENV.fetch['DEVISE_JWT_SECRET_KEY'].first
    current_user = User.find(jwt_payload['sub'])
    if current_user
      render json: {
        status: { code: 200, message: 'Signed out successfully.' }
      }
    else
      render json: {
        status: { code: 500, message: 'Signed out failed.' }
      }
    end
  end
end
