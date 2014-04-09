class WelcomeController < ApplicationController
  before_action :user_signed_in?
  before_action :load_categories


  #
  #
  def index
    if params[:key] && Category.exists?(key: params[:key])
      @products = Category.find_by(key: params[:key]).products
    elsif params[:keyword]
      unless params[:keyword].blank?
        @products = Product.where("name like '%#{params[:keyword]}%'")
      else
        @products = Product.all
      end
    else
      @products = Product.last(10)
    end
  end

private

  #
  #
  def load_categories
    @categories = Category.all.order("name ASC")
  end
end
