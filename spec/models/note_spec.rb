require 'rails_helper'

RSpec.describe Note, type: :model do
  it { should belong_to(:topic)  }
  it { should belong_to(:type)  }
  it { should validate_presence_of(:title)  }
  it { should validate_presence_of(:text)  }
  it { should validate_presence_of(:topic)  }
  it { should validate_presence_of(:type)  }

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

  it 'has nested attributes for topic'
  it 'integrates with elastic search'
end
