class CreateMeasurements < ActiveRecord::Migration[5.2]
  def change
    create_table :measurements do |t|
      t.string :measurement, null: false
      t.belongs_to :recipe, null: false
      t.belongs_to :ingredient, null: false

      t.timestamps
    end
  end
end
