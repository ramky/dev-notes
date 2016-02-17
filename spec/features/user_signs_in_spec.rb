require 'rails_helper'

RSpec.feature 'user signs in', type: :feature do
  scenario 'with valid facebook credentials', {js: true} do
    create(:authen_whitelist)
    complete_facebook_auth_on_click

    expect(page).to have_content 'Welcome Ram Iyer!'
  end
end
