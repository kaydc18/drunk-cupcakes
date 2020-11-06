class CreateRecipes < ActiveRecord::Migration[5.2]
  def up
    create_table :recipes, id: false do |t|
      t.bigint :id, primary: true
      t.string :name, null: false

      t.timestamps
    end
    execute %Q{ ALTER TABLE "recipes" ADD PRIMARY KEY ("id"); }
  end
  def down
    drop_table(:recipes)
  end
end
