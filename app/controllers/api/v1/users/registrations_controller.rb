class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  protect_from_forgery with: :null_session

  respond_to :json

  private

  def respond_with(resource, _options = {})
    resource.persisted? ? register_success : register_failed
  end

  def register_success
    render json: {
      status: { code: 200, message: 'Signed up successfully.',
                data: resource }
    }
  end

  def register_failed
    render json: {
      status: { code: 500, message: 'Signed up failed.',
                errors: resource.errors.full_messages }
    }
  end
end
