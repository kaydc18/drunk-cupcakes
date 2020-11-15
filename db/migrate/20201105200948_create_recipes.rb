class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.bigint :drink_id, null: false
      t.string :drink_name, null: false
      t.text :drink_image

      t.timestamps
    end
  end
end
