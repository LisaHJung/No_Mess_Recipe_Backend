class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.string :name
      t.text :image
      t.text :video
      t.string :ingredients
      t.string :instructions
      t.references :user, null: false, foreign_key: true
    end
  end
end
