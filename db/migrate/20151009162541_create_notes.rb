class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :text
      t.string :encrypted_text
      t.integer :type_id
      t.integer :topic_id

      t.timestamps null: false
    end
  end
end
