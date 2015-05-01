class CreateGlycemies < ActiveRecord::Migration
  def change
    create_table :glycemies do |t|
      t.integer :valeur
      t.string :note
      t.references :users, index: true
      t.date :date

      t.timestamps
    end
  end
end
