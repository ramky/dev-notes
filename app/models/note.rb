class Note < ActiveRecord::Base
  SECRET_KEY = ENV['SECRET_KEY']

  include Model::Common

  belongs_to :topic
  belongs_to :type
  accepts_nested_attributes_for :topic

  validates_presence_of :title, :text, :topic, :type

  before_save do
    self.encrypted_text = encrypted_text.encrypt(:symmetric, :password => SECRET_KEY) unless encrypted_text.blank?
  end

  default_scope -> { order("updated_at desc")}

  def type_name
    type.title
  end

  def vim_note?
    type_name =~ /vim/i
  end

  def password?
    type_name =~ /password/i
  end

  def markdown?
    type_name =~ /markdown/i
  end

  def quote?
    type_name =~ /quote/i
  end

  def notes_by_line
    text.split("\r\n")
  end

  def decrypted_text
    encrypted_text.decrypt(:symmetric, :password => SECRET_KEY)
  end
end
