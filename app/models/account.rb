class Account < ActiveRecord::Base
  has_many :topics
  has_secure_password

  validates :email_address, presence: true, uniqueness: true
end
