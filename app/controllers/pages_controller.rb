class PagesController < ApplicationController
  skip_authorization_check
  # include CurrentCart
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

  def blogs
    @articles = Article.all
  end

  def blog
    @article = Article.find(params.expect(:id))
  end

  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
