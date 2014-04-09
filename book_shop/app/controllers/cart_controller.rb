class CartController < ApplicationController

  def add_product
    @product = Product.find(params[ :product_id])
    # Añadir al pedido
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js #{ render text: "JS" } envia texto plano
    end
  end

  def remove_product
    @product = Product.find(params[:product_id])
    # Borrar del pedido
    respond_to do |format|
      format.js
    end
  end
end
