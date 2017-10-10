class ProductController < ApplicationController
  def show
    @products = Product.find_by id: params[:id]
    if @products
      @related_products = Product.not_original(params[:id]).sort_by_product.take(Settings.related_product.config)
      @new_products = Product.sort_by_product.take(Settings.new_product.config)
    else
      flash[:warning] = t "static_pages_controller.errors"
      redirect_to root_url
    end
  end
end
