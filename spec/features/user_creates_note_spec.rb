require 'rails_helper'

RSpec.feature 'User creates note', type: :feature do
  scenario 'User successfully creates note under a topic', {js: true} do
    create(:type)
    create(:authen_whitelist)
    complete_facebook_auth_on_click
    sleep 1
    visit new_topic_path

    fill_in "topic_name", with: 'VIM shortcuts'
    fill_in "topic_description", with: 'All my VIM shortcuts.'
    click_button 'Create Topic'

    click_link 'VIM shortcuts'
    click_link 'New Note'

    select 'Dev Notes', from: 'note[type_id]'
    fill_in 'note_title', with: 'change tab'
    fill_in 'note_text', with: '\w'
    click_button 'Create Note'

    expect(page).to have_content 'Note was successfully created.'
  end
end

