class Api::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(_resource, _opts = {})
    render json: { message: 'You are logged in.' }, status: :ok
  end
end
