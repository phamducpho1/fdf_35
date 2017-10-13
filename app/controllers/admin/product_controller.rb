class Admin::ProductController < ApplicationController
  before_action :admin_user, only: :destroy
  before_action :load_product, only: %i(show destroy)

  def show; end

  def index
    @product = Product.find_category(params[:q])
    @products = Product.sort_by_products
    @categories = Category.sort_by_category
  end

  def new
    @product = Product.new
  end

  def destroy
    if @product.destroy
      flash[:success] = t "admin.deleted"
    else
      flash[:warning] = t "admin.notdelete"
    end
    redirect_to admin_product_index_path
  end

  private

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:warning] = t "users_controller.errorss"
    redirect_to admin_product_index_path
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
