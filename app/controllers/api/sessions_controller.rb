class Api::SessionsController < Devise::SessionsController
  protect_from_forgery prepend: true
  skip_before_action :verify_authenticity_token
  respond_to :json
end
