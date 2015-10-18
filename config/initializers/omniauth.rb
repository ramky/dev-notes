OmniAuth.config.logger = Rails.logger

FB_APP_ID = ENV['FB_APP_ID']
FB_APP_SECRET = ENV['FB_APP_SECRET']

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FB_APP_ID, FB_APP_SECRET, {:provider_ignores_state => true}
end
