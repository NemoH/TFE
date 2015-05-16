class CreateGlycemies < ActiveRecord::Migration
  def change
    create_table :glycemies do |t|
      t.integer :valeur
      t.string :note
      t.references :user, index: true
      t.datetime :date
      t.boolean :hyper
      t.boolean :hypo

      t.timestamps
    end
  end
end
