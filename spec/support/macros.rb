def set_current_account(account=nil)
  session[:account_id] = (account || create(:account_id)).id
end

def index_and_refresh(note, do_sleep: true)
  note.__elasticsearch__.index_document
  note.class.__elasticsearch__.refresh_index!
  sleep(1) if do_sleep
end