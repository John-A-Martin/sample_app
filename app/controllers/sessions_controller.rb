class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # sign the user in  TODO:
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!  TODO:
      render 'new'
    end
  end

  def destroy
  end

end
