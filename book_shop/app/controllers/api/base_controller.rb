module Api
  class BaseController < ApplicationController

    respond_to :json

    def send_error(message)
      respond_with({success: false, error: message })
    end
  end
end
