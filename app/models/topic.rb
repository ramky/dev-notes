class Topic < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  include Model::Common
  has_many :notes

  validates_presence_of :name

  default_scope -> { order("updated_at desc")}
  scope :all_for_account, -> (account_id) { where("account_id = ?", account_id)}

  def notes_count
    notes.count
  end
end
