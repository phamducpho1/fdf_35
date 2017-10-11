class Admin
  class ProductController < ApplicationController
    before_action :admin_user, only: :destroy
    before_action :load_product, only: :show

    def show; end

    def index
      @product = Product.find_category(params[:q])
      @products = Product.sort_by_products
      @categories = Category.sort_by_category
    end

    def new
      @product = Product.new
    end

    private

    def load_product
      @product = Product.find_by id: params[:id]
      return if @products
      flash[:warning] = t "users_controller.errorss"
      redirect_to users_path
    end
  end
end
