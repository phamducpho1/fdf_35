class Admin < ApplicationController
  class CategoryController
    before_action :admin_user, only: :destroy
    before_action :load_category, only: :show

    def show; end

    def index
      @categories = Category.sort_by_category
    end

    def new
      @category = Category.new
    end

    private

    def load_category
      @category = Category.find_by id: params[:id]
      return if @categories
      flash[:warning] = t "users_controller.errorss"
      redirect_to users_path
    end
  end
end
