require 'rails_helper'

RSpec.describe Topic, type: :model do
  it { should have_many(:notes) }
  it { should belong_to(:account) }
  it { should validate_presence_of(:name)  }
end
