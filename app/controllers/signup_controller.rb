class SignupController < ApplicationController

  def new
    @show_navbar=true
    @user=User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      create_order_for_user(@user.id)
      redirect_to menu_path, notice: "Successfully created an account"
    else
      render :new
    end
  end
  def user_params
    params.require(:user).permit(:name, :email, :phno, :password)
  end

  private
def create_order_for_user(user_id)
  Order.create(user_id: user_id)
end
end
