class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.bigint :ingredient_id, null: false
      t.string :ingredient_name, null: false
      t.boolean :ingredient_alcohol, null: false

      t.timestamps
    end
  end
end
