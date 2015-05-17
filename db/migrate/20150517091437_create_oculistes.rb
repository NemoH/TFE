class CreateOculistes < ActiveRecord::Migration
  def change
    create_table :oculistes do |t|
      t.datetime :rdv
      t.text :note
      t.references :user, index: true
      t.timestamps
    end
  end
end
