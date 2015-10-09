class Note < ActiveRecord::Base
  belongs_to :topic
  belongs_to :type
  accepts_nested_attributes_for :topic

  validates_presence_of :title, :text, :topic, :type
end
