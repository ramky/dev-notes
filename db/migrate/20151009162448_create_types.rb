class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :code
      t.string :additional1
      t.string :additional2

      t.timestamps null: false
    end
  end
end
