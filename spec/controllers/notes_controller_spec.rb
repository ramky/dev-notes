require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  describe 'PUT :update' do
    context 'with correct input values' do
      it 'should return to the :show action for the note' do
        ram   = create(:account)
        set_current_account(ram)
        topic = create(:topic)
        dev_notes = create(:type)
        note = create(:note, topic_id: topic.id, type_id: dev_notes.id)

        patch :update, id: note.id, topic_id: topic.id, note: { title: 'updated note title', topic_id: topic.id  }

        expect(response).to redirect_to edit_topic_path(topic)
      end
    end
  end
end
