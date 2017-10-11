class CartsController < ApplicationController
  before_action :set_cart, only: [:show]

  def show; end

  def create; end

  private

  def set_cart
    @cart = Cart.find_by id: params[:id]
    return if @cart
    flash[:warning] = t "static_pages_controller.eror_cart"
    redirect_to root_url
  end
end
