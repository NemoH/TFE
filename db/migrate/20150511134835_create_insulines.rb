class CreateInsulines < ActiveRecord::Migration
  def change
    create_table :insulines do |t|
      t.string :name
      t.integer :unit
      t.date :date
      t.string :note
      t.references :users, index: true
      t.timestamps
    end
  end
end
