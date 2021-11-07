class Api::SessionsController < Devise::SessionsController
  protect_from_forgery prepend: true
  skip_before_action :verify_authenticity_token
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.email && resource.type
      render json: { data: { email: resource.email, type: resource.type.downcase } }
    else
      head :unauthorized
    end
  end

  def respond_to_on_destroy
    head :ok
  end
end
