module Api
  class BaseController < ApplicationController
    include ActionController::HttpAuthentication::Token::ControllerMethods

    respond_to :json
    before_action :authenticate

    def send_error(message)
      respond_with({success: false, error: message })
    end

  private
    ##
    # HEADER_FIELD  |VALUE
    # --------------|------------------------
    # Authorization: Token token="......."
    #
    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        @api_session = SessionToken.find_by(token: token)
        if @api_session
          return true
        else
          head :unathorized
          return false
        end
      end
    end
  end
end
