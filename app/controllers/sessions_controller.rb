class SessionsController < ApplicationController
  def new; end

  def create
    account = Account.find_by(email_address: params[:login][:email_address])
    if account && account.authenticate(params[:login][:password])
      session[:account_id] = account.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash[:danger] = 'You are not authorized to view this application.'
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:account_id] = nil
    redirect_to root_url
  end
end
