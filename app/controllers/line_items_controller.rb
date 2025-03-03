class LineItemsController < ApplicationController
  skip_authorization_check
  include CurrentCart
  before_action :set_cart, only: %i[create]
  before_action :set_line_item, only: %i[show edit update destroy]

  # GET /line_items or /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1 or /line_items/1.json
  def show; end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit; end

  # POST /line_items or /line_items.json
  def create
    product = Product.find(params[:product_id])
    quantity = params[:quantity]
    @line_item = @cart.add_product(product, quantity)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to boutique_url, notice: "#{@line_item.product.name} was added to cart." }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    product = @line_item.product.name
    @line_item.destroy!

    respond_to do |format|
      format.html { redirect_to boutique_url, status: :see_other, notice: "#{product} was removed from cart." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_line_item
    @line_item = LineItem.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def line_item_params
    params.expect(line_item: %i[product_id])
  end
end
