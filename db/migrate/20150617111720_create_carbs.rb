class CreateCarbs < ActiveRecord::Migration
  def change
    create_table :carbs do |t|
      t.integer :valeur
      t.string :note
      t.datetime :date
      t.references :user, index: true
      t.timestamps
    end
  end
end
