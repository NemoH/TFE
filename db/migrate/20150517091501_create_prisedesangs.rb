class CreatePrisedesangs < ActiveRecord::Migration
  def change
    create_table :prisedesangs do |t|
      t.datetime :rdv
      t.text :note
      t.references :user, index: true
      t.timestamps
    end
  end
end
