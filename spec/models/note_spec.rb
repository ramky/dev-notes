require 'rails_helper'

RSpec.describe Note, type: :model do
  it { should belong_to(:topic)  }
  it { should belong_to(:type)  }
  it { should validate_presence_of(:title)  }
  it { should validate_presence_of(:text)  }
  it { should validate_presence_of(:topic)  }
  it { should validate_presence_of(:type)  }
  it { should accept_nested_attributes_for(:topic)  }

  describe ':before_save callback' do
    it 'should update the encrypted_text for passwords' do
      password = 'some password'
      ram            = create(:account)
      type           = create(:type, title: 'password')
      topic          = create(:topic, account_id: ram.id)
      note           = build(:note, type_id: type.id,
                              topic_id: topic.id,
                              encrypted_text: password)
      encrypted_text = password.encrypt(:symmetric,
                                        :password => \
                                        ENV['SECRET_KEY'])

      note.save!
      note.reload

      expect(note.encrypted_text).to eq encrypted_text
    end
  end

  describe '.search' do
    it 'should boost the score on title than text' do
      ram         = create(:account)
      topic       = create(:topic, account_id: ram.id)
      type        = create(:type)
      @note1      = create(:note, title: 'Ruby on Rails',
                           text: 'My favorite web framework',
                           topic_id: topic.id,
                           type_id: type.id)
      @note2      = create(:note, title: 'RSpec',
                           text: 'I prefer Rspec over Minitest for Ruby on Rails',
                           topic_id: topic.id,
                           type_id: type.id)
      index_and_refresh(@note1, do_sleep: false) # Sleep just once
      index_and_refresh(@note2)

      search_result = Note.search('Ruby on Rails')

      expect(search_result[0].title).to eq 'Ruby on Rails'
      expect(search_result.count).to eq 2
      expect(search_result[1].title).to eq 'RSpec'
    end
  end
end
