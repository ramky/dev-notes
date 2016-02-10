def set_current_account(account=nil)
  session[:account_id] = (account || create(:account_id)).id
end

