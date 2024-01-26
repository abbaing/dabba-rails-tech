class ApplicationController < ActionController::Base
    include CommonResponses

    rescue_from ActiveRecord::RecordNotFound do
        render404
    end
end
