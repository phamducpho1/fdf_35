class ApplicationController < ActionController::Base
  helper_method [:recent_products, :last_viewed_product]
  protect_from_forgery with: :exception
  include SessionsHelper

  def current_cart
    @cart_id = Cart.find_by id: session[:cart_id]
    if @cart_id.blank?
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    else
      Cart.find_by id: session[:cart_id]
    end
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "ple_login"
    redirect_to login_url
  end

  def recent_products
    @recent_products ||= RecentProducts.new cookies
  end

  def last_viewed_product
    recent_products.reverse.second
  end
end
