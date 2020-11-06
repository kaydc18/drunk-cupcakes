class CreateRecipes < ActiveRecord::Migration[5.2]
  def up
    create_table :recipes do |t|
      t.bigint :drinks_id, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
