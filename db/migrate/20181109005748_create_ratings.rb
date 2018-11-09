class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :rating_value
      t.references :cocktail, foreign_key: true

      t.timestamps
    end
  end
end
