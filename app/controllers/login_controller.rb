class LoginController < ApplicationController
  def new
    @show_navbar=true
  end

  def create
      user=User.find_by(email: params[:email])
      if user.present? && user.authenticate(params[:password])
          session[:user_id]=user.id
          create_order_for_user(user.id)
          redirect_to menu_path,notice: 'logged in succesfully'
      else
          flash[:alert]='invalid email or password'
          render :new
      end
  end
  def destroy
    session[:user_id]=nil
    redirect_to root_path,notice: 'logged out'
end
private
def create_order_for_user(user_id)
Order.create(user_id: user_id)
end
end
