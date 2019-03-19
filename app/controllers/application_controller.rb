class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_account
    # @current_account ||= Account.find(session[:account_id]) if session[:account_id]
    account = Account.first
    session[:account_id] = account.id
    @current_account = account
  end

  def require_user
    redirect_to sign_in_path unless current_account
  end

  helper_method :current_account
  helper_method :require_user
end
