class Note < ActiveRecord::Base
  SECRET_KEY = ENV['SECRET_KEY']

  include Model::Common

  belongs_to :topic
  belongs_to :type
  accepts_nested_attributes_for :topic

  validates_presence_of :title, :text, :topic, :type

  before_save do
    self.encrypted_text = encrypted_text.encrypt(:symmetric, :password => SECRET_KEY) unless encrypted_text.nil?
  end

  def type_name
    type.title
  end

  def password?
    type.title =~ /password/i
  end

  def decrypted_text
    encrypted_text.decrypt(:symmetric, :password => SECRET_KEY)
  end
end
