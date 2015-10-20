class AuthenWhitelist < ActiveRecord::Base
  def self.not_authorized?(facebook_username)
    if AuthenWhitelist.count == 0
      return true
    end
    unless AuthenWhitelist.pluck(:name).include?(facebook_username)
      return true
    end
    false
  end
end
