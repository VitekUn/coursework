# frozen_string_literal: true

# SessionsController
class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user&.authenticate(params[:session][:password])
      create_a
    else
      create_b
    end
  end

  def create_a
    log_in @user
    params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
    redirect_to @user
  end

  def create_b
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
