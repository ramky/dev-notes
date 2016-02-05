class Note < ActiveRecord::Base
  SECRET_KEY = ENV['SECRET_KEY']

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include Model::Common

  belongs_to :topic
  belongs_to :type
  accepts_nested_attributes_for :topic

  validates_presence_of :title, :text, :topic, :type

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :title, analyzer: 'english', index_options: 'offsets'
      indexes :text, analyzer: 'english'
    end
  end

  # ^10 boosts by 10 the score of hits when the search term is
  # matched in the title
  def self.search(query)
    __elasticsearch__.search(
        {
            query: {
                multi_match: {
                    query: query,
                    fields: ['title^10', 'text']
                }
            },
        }
    )
  end

  before_save do
    self.encrypted_text = encrypted_text.encrypt(:symmetric, \
                                                 :password => \
                                                 SECRET_KEY) \
                                                 unless encrypted_text.blank?
  end # before save

  default_scope -> { order("updated_at desc")}

  def type_name
    type.title
  end

  def vim_note?
    type_name =~ /vim/i
  end

  def password?
    type_name =~ /password/i
  end

  def markdown?
    type_name =~ /markdown/i
  end

  def quote?
    type_name =~ /quote/i
  end

  def notes_by_line
    text.split("\r\n")
  end

  def decrypted_text
    encrypted_text.decrypt(:symmetric, :password => SECRET_KEY)
  end
end # class

# Delete the previous articles index in Elasticsearch
Note.__elasticsearch__.client.indices.delete index: Note.index_name rescue nil

# Create the new index with the new mapping
Note.__elasticsearch__.client.indices.create \
  index: Note.index_name,
  body: { settings: Note.settings.to_hash, mappings: Note.mappings.to_hash }


Note.import # for auto sync model with elastic search
