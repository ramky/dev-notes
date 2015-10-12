class Topic < ActiveRecord::Base
  has_many :notes

  validates_presence_of :name

  def last_updated
    updated_at.ago_in_words
  end

  def notes_count
    notes.count
  end
end
