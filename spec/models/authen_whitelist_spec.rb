require 'rails_helper'

RSpec.describe AuthenWhitelist, type: :model do
  describe '.not_authorized?' do
    let(:facebook_username) { 'Ram Iyer' }
    context 'no records in authen_whitelists table' do
      it 'returns false' do
        expect(AuthenWhitelist.count).to eq 0
        expect(AuthenWhitelist.not_authorized?(facebook_username)).to \
          be_truthy
      end
    end

    context 'with records in authen_whitellists table' do
      it "returns true if username doesn't exist in table" do
        create(:authen_whitelist)
        expect(AuthenWhitelist.not_authorized?('John Doe')).to \
          be_truthy
      end
      it 'returns false if username exists in table' do
        create(:authen_whitelist)
        expect(AuthenWhitelist.not_authorized?('ram iyer')).to \
          be_falsey
      end
    end
  end
end
