class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.bigint :id, primary: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
