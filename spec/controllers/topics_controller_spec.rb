require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  describe 'GET :index' do
    context 'with correct authentication credentials' do
      it 'should assign the instance variable called :topics' do
        ram   = create(:account)
        set_current_account(ram)
        topic1 = create(:topic, account_id: ram.id)
        topic2 = create(:topic, account_id: ram.id)
        topic3 = create(:topic, account_id: ram.id)

        get :index

        expect(assigns(:topics).first.name).to eq  topic1.name
        expect(assigns(:topics).last.name).to eq   topic3.name
      end
    end

    context 'without authentication' do
      it_behaves_like 'requires sign in' do
        let(:action) { get :index }
      end
    end
  end

  describe 'POST :create' do
    context 'with correct authentication credentials' do
      it 'should create a topic with the values provided' do
        name        = 'My Pet topic'
        description = 'All things about my pet topic'
        ram         = create(:account)
        type        = create(:type)
        set_current_account(ram)

        post :create, topic: { name: name, description: description, types: [type ]}

        expect(assigns(:topic).name).to eq name
        expect(assigns(:topic).description).to eq description
      end
    end

    context 'without authentication' do
      it_behaves_like 'requires sign in' do
        let(:action) { post :create }
      end
    end
  end
end
