class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.decimal :hb
      t.text :note
      t.datetime :date
      t.references :user, index: true
      t.timestamps
    end
  end
end
