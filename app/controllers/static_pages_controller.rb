class StaticPagesController < ApplicationController
  def index
    @categories = Category.sort_by_category
    @products = Product.sort_by_product.take(Settings.per_page.config)
  end

  def help; end

  def show
    @categories = Category.sort_by_category
    @current_category = Category.find_by id: params[:id]
    if @current_category
      @products = @current_category.products.paginate(page: params[:page], per_page: Settings.per_page.config)
    else
      flash[:warning] = t "static_pages_controller.errors"
      redirect_to root_url
    end
  end
end
