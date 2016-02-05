require 'rails_helper'

RSpec.describe Topic, type: :model do
  it { should have_many(:notes) }
  it { should belong_to(:account) }
  it { should validate_presence_of(:name)  }

  it 'should order by name' do
    topic1 = create(:topic)
    topic2 = create(:topic, name: 'Rails Setup',
                    description: 'All things Rails')

    expect(Topic.first.name).to eq 'Rails Setup'
  end

  describe '.all_for_account' do
     it 'returns topics for account' do
       ram      = create(:account)
       topic1   = create(:topic, account_id: ram.id)
       topic2   = create(:topic, name: 'Rails Setup',
                         description: 'All things Rails', account_id: ram.id)

       john     = create(:account, name: 'John Doe')
       topic3   = create(:topic, name: 'Elixir Setup',
                         description: 'All things Elixir', account_id: john.id)

       expect(Topic.all_for_account(ram.id).count).to eq 2
       expect(Topic.all_for_account(ram.id).first.name).to eq 'Rails Setup'
     end
  end

  describe '#notes_count' do
    it 'counts the number of notes for a topic' do
      ram   = create(:account)
      topic = create(:topic, account_id: ram.id)
      type  = create(:type)
      note1  = create(:note, topic_id: topic.id, type_id: type.id)
      note2  = create(:note, topic_id: topic.id, type_id: type.id)

      expect(topic.notes_count).to eq(2)
    end
  end

  describe '#last_updated' do
    it 'gives human friendly updated datetime' do
      ram = create(:account)
      topic = create(:topic, account_id: ram.id, updated_at: Time.now - 2.hours)

      expect(topic.last_updated).to eq 'about 2 hours'
    end
  end
end
