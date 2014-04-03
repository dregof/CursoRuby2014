class WelcomeController < ApplicationController
  before_action :user_signed_in?
  before_action :load_categories


  #
  #
  def index
    @products = Product.last(10)
  end

private

  #
  #
  def load_categories
    @categories = Category.all.order("name ASC")
  end
end
