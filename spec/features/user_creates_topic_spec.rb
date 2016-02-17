require 'rails_helper'

RSpec.feature 'User creates topic', type: :feature do
  scenario 'User successfully creates topic after facebook authentication', {js: true} do
    create(:authen_whitelist)
    complete_facebook_auth_on_click
    sleep 1
    visit new_topic_path

    fill_in "topic_name", with: 'VIM shortcuts'
    fill_in "topic_description", with: 'All my VIM shortcuts.'
    click_button 'Create Topic'

    expect(page).to have_content 'Topic was successfully created.'
  end
end

