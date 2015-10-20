class CreateAuthenWhitelists < ActiveRecord::Migration
  def change
    create_table :authen_whitelists do |t|
      t.string :name

      t.timestamps
    end
  end
end
