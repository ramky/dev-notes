require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET :new' do
    it 'renders the new template for unauthenticated users' do
      get :new

      expect(response).to render_template :new
    end
  end

  describe 'POST :create' do
    context 'with valid facebook credentials' do
      it 'puts the signed in users credentials in the session' do
        ram     = create(:account)
        allow(Account).to \
          receive(:from_omniauth).
          and_return(ram)

        post :create, provider: 'facebook'
        expect(session[:account_id]).to eq ram.id
      end
    end

    context 'with invalid facebook credentials' do
      it 'redirects to sign_in path' do
        allow(Account).to \
          receive(:from_omniauth).
          and_return(nil)

        post :create, provider: 'facebook'
        expect(response).to redirect_to sign_in_path
      end
    end
  end

  describe 'GET :destroy' do
    it 'resets the account_id in session' do
      ram = create(:account)
      session[:account_id] = ram.id

      get :destroy

      expect(session[:account_id]).to be_nil
    end
  end
end
