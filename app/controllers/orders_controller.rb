class OrdersController < ApplicationController

  before_action :authenticate_user!

  def index

    if signed_in? && current_user.admin?
      @orders = Order.all
    else
      @orders = Order.where(user_id: current_user.id)
    end

  end
  
  def show
  end
  
  def new
  end
  
  def create
  end

  def destroy
  end



end