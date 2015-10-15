class Topic < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  include Model::Common
  has_many :notes

  validates_presence_of :name


  def notes_count
    notes.count
  end
end
