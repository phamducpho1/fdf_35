class LineItemsController < ApplicationController
  before_action :load_product, only: [:create]

  def index; end

  def create
    @cart = current_cart
    @line_item = @cart.add_product @product.id
    if @line_item.save
      flash[:success] = t "static_pages_controller.success"
      redirect_to @line_item.cart
    else
      flash[:success] = t "static_pages_controller.error_item"
    end
  end

  private

  def load_product
    @product = Product.find_by id: params[:product_id]
    return if @product
    flash[:warning] = t "static_pages_controller.error_product"
    redirect_to root_url
  end
end
