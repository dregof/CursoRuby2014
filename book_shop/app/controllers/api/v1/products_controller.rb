module Api
  module V1
    class ProductsController < Api::BaseController
      def index
        products = Product.all

        unless products.empty?
         respond_with({ success: true, products: products })
        else
          send_error("No hay productos disponibles")
        end
      end

      def show
        product = Product.find(params[:id])

        if product
         respond_with({
          success: true,
          product: product.as_json(
            {include: [:category => {only: :name}]}
          )
        })
        else
          send_error("El producto no existe.")
        end
      end
    end
  end
end
