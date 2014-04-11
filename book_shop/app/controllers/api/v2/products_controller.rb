module Api
  module V2
    class ProductsController < Api::BaseController
      def index
        render text: "Hola estoy en el V2"
      end

      def show
        render text: "Hola estoy en el V2"
      end
    end
  end
end
