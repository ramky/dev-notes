class Account < ActiveRecord::Base
  has_many :topics

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.provider = auth.provider
      user.uid      = auth.uid
      user.name     = auth.info.name
      # Don't want everyone in the world to use my app
      # Control access through the database
      user_name = user.name.try(:downcase) || ''
      return if AuthenWhitelist.not_authorized?(user_name)

      user.save
    end
  end
end
