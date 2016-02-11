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
      context 'with correct input values' do
        it 'should create a topic with the values provided' do
          name        = 'My Pet topic'
          description = 'All things about my pet topic'
          ram         = create(:account)
          set_current_account(ram)

          post :create, topic: { name: name, description: description }

          expect(assigns(:topic).name).to eq name
          expect(assigns(:topic).description).to eq description
        end
      end

      context 'with incorrect input values' do
        it 'should create a topic with the values provided' do
          description = 'All things about my pet topic'
          ram         = create(:account)
          type        = create(:type)
          set_current_account(ram)

          post :create, topic: { description: description }

          expect(response).to render_template :new
        end
      end
    end

    context 'without authentication' do
      it_behaves_like 'requires sign in' do
        let(:action) { post :create }
      end
    end
  end

  describe 'PUT :update' do
    context 'with correct authentication credentials' do
      context 'with correct input values' do
        it 'should update a topic with the values provided' do
          name        = 'My Pet topic'
          description = 'All things about my pet topic'
          ram         = create(:account)
          set_current_account(ram)
          topic       = create(:topic)

          put :update, id: topic.id, topic: { name: name,
                                              description: description }

          expect(assigns(:topic).name).to eq name
          expect(assigns(:topic).description).to eq description
        end
      end

      context 'with incorrect input values' do
        it 'should create a topic with the values provided' do
          ram         = create(:account)
          set_current_account(ram)
          topic       = create(:topic)

          put :update, id: topic.id, topic: { name: '' }

          expect(response).to render_template :edit
        end
      end
    end

    context 'without authentication' do
      it_behaves_like 'requires sign in' do
        let(:action) { put :update, id: create(:topic).id }
      end
    end
  end

  describe 'DELETE :destroy' do
    context 'with correct authentication credentials' do
      it 'should destroy the topic' do
        ram         = create(:account)
        set_current_account(ram)
        topic       = create(:topic)

        delete :destroy, id: topic.id

        expect(Topic.count).to eq 0
      end
    end

    context 'without authentication' do
      it_behaves_like 'requires sign in' do
        let(:action) { delete :destroy, id: create(:topic).id }
      end
    end
  end
end
