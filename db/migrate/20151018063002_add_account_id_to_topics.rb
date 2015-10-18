class AddAccountIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :account_id, :integer
    add_index :topics, :account_id
  end
end
