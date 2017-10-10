class StaticPagesController < ApplicationController

  def index
    @categories = Category.sort_by_category
    @products = Product.sort_by_product.paginate(page: params[:page], per_page: Settings.per_page.config)
  end

  def help; end
end
