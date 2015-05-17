class CreateMedecins < ActiveRecord::Migration
  def change
    create_table :medecins do |t|
      t.datetime :rdv
      t.text :note
      t.references :user, index: true
      t.timestamps
    end
  end
end
