class Admin::OrderdetailsController < ApplicationController
  before_action :load_orderdetail, only: %i(edit update show)

  def show
    @orders = Order.all
  end

  private

  def load_orderdetail
    @order_details = OrderDetail.find_order params[:id]
    return if @order_details
    flash[:warning] = "users_controller.errorss"
    redirect_to admin_orderdetail_path
  end
end
