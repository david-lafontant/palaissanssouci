class PagesController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index; end

  def about; end

  def contact; end

  def boutique
    @merchandises = Category.includes(:products).all
  end

  def department
    # get category as param fom url and find all the products that belong to the category
    category = params[:id]
    @products = Product.where(category_id: category)
  end

  def details
    @product = Product.find(params.expect(:id))
  end
end
