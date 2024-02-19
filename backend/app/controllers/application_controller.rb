class ApplicationController < ActionController::Base
  include CommonResponses

  # Testing purpose action
  skip_before_action :verify_authenticity_token

  rescue_from ActiveRecord::RecordNotFound do
    render404
  end
end
