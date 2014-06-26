class JewelriesController < ApplicationController

  def mark_for_sale
    @to_mark = Jewelry.find_by_id(params['id'])
    if (current_user.id != @to_mark.user_id)
      flash[:alert] = "You cannot sell that which you do not own!"
      redirect_to root_path
    else
      @to_mark.mark_for_sale
      flash[:notice] = "It is now ready for sale."
      redirect_to user_path(current_user)
    end
  end

  def sell
    @to_sell = Jewelry.find_by_id(params['id'])
    if @to_sell.sell(current_user)
      flash[:notice] = "You bought it."
      redirect_to user_path(current_user)
    else
      flash[:alert] = "You didn't buy it, something went wrong."
      redirect_to jewelries_path
    end
  end

  def index
    @jewelries = Jewelry.where({:sellable => true})
  end

  def new
    @jewelry = Jewelry.new
  end

  def create
    jewelry_params = params.require(:jewelry).permit(:jewelry_type, :materials_cost, :hours_worked, :user_id)
    @jewelry = current_user.jewelries.new(jewelry_params)
    msg = @jewelry.verify_input
    if (!msg && @jewelry.save)
      flash[:notice] = "Your jewelry has been created."
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Your jewelry has not been created."
      flash[:alert] += " " + msg if msg
      redirect_to new_jewelry_path
    end
  end
end
