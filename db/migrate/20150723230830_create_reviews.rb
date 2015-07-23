class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :tittle
      t.string :body
      t.integer :pelu_rating
      t.belongs_to :peluqueria, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :reviews, :peluquerias
    add_foreign_key :reviews, :users
  end
end
