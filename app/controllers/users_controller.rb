class UsersController < ApplicationController

  def show
    @user = User.find_by_id(params[:id])
    @jewelries = @user.jewelries.order(:jewelry_type)
  end
end
