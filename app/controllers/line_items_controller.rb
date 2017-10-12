class LineItemsController < ApplicationController
  before_action :load_product, only: [:create]
  before_action :load_item, only: [:destroy]
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

  def destroy
    if @delete_item.destroy
      flash[:success] = t "static_pages_controller.item_path"
    else
      flash[:warning] = t "static_pages_controller.error_item"
    end
    redirect_to cart_path(session[:cart_id])
  end

  private

  def load_product
    @product = Product.find_by id: params[:product_id]
    return if @product
    flash[:warning] = t "static_pages_controller.error_product"
    redirect_to root_url
  end

  def load_item
    @delete_item = LineItem.find_by id: params[:id]
    return if @delete_item
    flash[:warning] = t "static_pages_controller.error_item"
    redirect_to cart_path(session[:cart_id])
  end
end
