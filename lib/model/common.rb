require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper

module Model::Common
  # adds last_updated method to model
  def last_updated
    time_ago_in_words(updated_at, include_seconds: false)
  end
end
