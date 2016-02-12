require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  before(:all) do
    ram         = create(:account)
    topic       = create(:topic, account_id: ram.id)
    type        = create(:type)
    @note       = create(:note, title: 'VIM Notes',
                         text: 'My favorite text editor', topic_id: topic.id,
                         type_id: type.id)
    index_and_refresh(@note)
  end

  it 'gives a result for valid search' do
    get :search, q: 'VIM'

    expect(assigns(:notes).count).to eq 1
    expect(assigns(:notes).first.title).to eq 'VIM Notes'
  end

  it 'gives no result when there is no match' do
    get :search, q: 'Emacs'

    expect(assigns(:notes).count).to eq 0
  end

  it 'gives no result for an invalid search' do
    get :search, q: ''

    expect(assigns(:notes).count).to eq 0
  end
end
