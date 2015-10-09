class Note < ActiveRecord::Base
  belongs_to :topic
  belongs_to :type

  validates_presence_of :title, :text, :topic, :type
end
