class CreateRecipeBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_books do |t|
      t.belongs_to :recipe, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
