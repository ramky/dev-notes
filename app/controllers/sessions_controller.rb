class SessionsController < ApplicationController
  def new; end

  def create
    account = Account.from_omniauth(env["omniauth.auth"])
    if account
      session[:account_id] = account.id
      redirect_to root_url
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
