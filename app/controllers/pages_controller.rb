class PagesController < ApplicationController
  def index; end

  def about; end

  def contact; end

  def boutique
    @merchandises = Category.includes(:products).all
  end
end
