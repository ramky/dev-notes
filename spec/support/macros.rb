def set_current_account(account=nil)
  session[:account_id] = (account || create(:account_id)).id
end

def index_and_refresh(note, do_sleep: true)
  note.__elasticsearch__.index_document
  note.class.__elasticsearch__.refresh_index!
  sleep(1) if do_sleep
end

def complete_facebook_auth_on_click
  visit root_path
  sleep(1)
  popup = window_opened_by { click_link 'Sign in with Facebook' }
  within_window(popup) do
    fill_in_facebook_form
  end
end

def fill_in_facebook_form
  fill_in('email', :with => "#{ENV['TEST_FB_EMAIL']}")
  fill_in('pass', :with => "#{ENV['TEST_FB_PASS']}")
  find('#loginbutton').click
end
