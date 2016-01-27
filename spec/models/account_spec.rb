require 'rails_helper'

RSpec.describe Account, :type => :model do
  it { should have_many (:topics) }
end
