class Api::SessionsController < Devise::SessionsController
  respond_to :json
  skip_before_action :verify_authenticity_token
end
