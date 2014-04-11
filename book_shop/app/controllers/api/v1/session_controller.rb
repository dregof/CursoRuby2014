module Api
  module V1
    class SessionController < ApplicationController
      respond_to :json

      def generate_token
        rand_secret = params.permit(:secret)

        api_session = SessionToken.new(rand_secret)

        if api_session.save
          respond_with({ token: api_session.token })
        else
          respond_with({ message: "No te doy un token" })
        end
      end

    end
  end
end
