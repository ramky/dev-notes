module OmniAuthTestHelper
  def mock_valid_facebook_login
    if Rails.env.test?
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
        provider: 'facebook',
        uid: '123545',
        info: {
            first_name: "Ram",
            last_name:  "Iyer",
            email:      "ram@example.com"
        },
        credentials: {
            token: "123456",
            expires_at: Time.now + 1.week
        },
        extra: {
            raw_info: {
                gender: 'male'
            }
        }
      })
    end
  end
end
