class Topic < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  has_many :notes

  validates_presence_of :name

  def last_updated
    time_ago_in_words(updated_at, include_seconds: false)
  end

  def notes_count
    notes.count
  end
end
