shared_examples 'requires sign in' do
  it 'redirects to the sign in page' do
    session[:account_id] = nil
    action
    expect(response).to redirect_to sign_in_path
  end
end