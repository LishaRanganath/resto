class LoginController < ApplicationController
  def new
    @show_navbar=true
  end

  def create
      user=User.find_by(email: params[:email])
      if user.present? && user.authenticate(params[:password])
          session[:user_id]=user.id
          Order.create(user_id: user.id)
          redirect_to menu_path,notice: 'logged in succesfully'
      else
          flash[:alert]='invalid email or password'
          render :new
      end
  end
  def destroy
    current_user.orders.destroy_all
    session[:user_id]=nil
    reset_session
    redirect_to root_path,notice: 'logged out'
end
private
end
