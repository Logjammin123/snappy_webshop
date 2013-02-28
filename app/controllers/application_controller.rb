class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_or_create_the_current_cart
  before_filter :set_root_breadcrumb

  private
  def find_or_create_the_current_cart
    if current_user
      @current_cart = current_user.carts.find_or_create_by_state('open')
    end
  end

  def set_root_breadcrumb
    # add_breadcrumb 'home', :root_path
  end  
end
