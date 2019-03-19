# Adds password_digest and email_address to accounts table
class AddPasswordDigestAndEmailToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :password_digest, :string, after: :name
    add_column :accounts, :email_address, :string, after: :password_digest
  end
end
