class Topic < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  include Model::Common
  has_many :notes
  belongs_to :account

  validates_presence_of :name

  default_scope -> { order("name asc")}
  scope :all_for_account, -> (account_id) \
    { where("account_id = ?", account_id)}
  scope :notes_for_topic, -> (topic_id) \
    { Topic.joins(notes: :type).where("topics.id = ?", topic_id).select("notes.*, types.title as type_name") }
end
