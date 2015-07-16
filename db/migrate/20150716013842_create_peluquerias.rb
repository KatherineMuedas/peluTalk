class CreatePeluquerias < ActiveRecord::Migration
  def change
    create_table :peluquerias do |t|
      t.string :name
      t.string :phone
      t.string :website
      t.text :description
      t.boolean :accepts_credit_cards
      t.boolean :parking

      t.timestamps null: false
    end
  end
end
