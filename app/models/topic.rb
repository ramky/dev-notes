class Topic < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  include Model::Common
  has_many :notes
  belongs_to :account

  validates_presence_of :name

  default_scope -> { order("name asc")}
  scope :all_for_account, -> (account_id) { where("account_id = ?", account_id)}

  def notes_count
    notes.count
  end
end
