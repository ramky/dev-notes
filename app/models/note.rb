class Note < ActiveRecord::Base
  include Model::Common

  belongs_to :topic
  belongs_to :type
  accepts_nested_attributes_for :topic

  validates_presence_of :title, :text, :topic, :type
end
