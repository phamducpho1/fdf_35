class Admin::CategoryController < ApplicationController
  before_action :admin_user, only: :destroy
  before_action :load_category, only: %i(show destroy)

  def show; end

  def index
    @categories = Category.sort_by_category
  end

  def new
    @category = Category.new
  end

  def destroy
    if @category.destroy
      flash[:success] = t "admin.deleted"
    else
      flash[:warning] = t "admin.notdelete"
    end
    redirect_to admin_category_index_path
  end

  private

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:warning] = t "users_controller.errorss"
    redirect_to admin_category_index_path
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
