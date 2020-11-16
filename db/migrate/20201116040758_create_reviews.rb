class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.text :thoughts
      t.text :suggested_edits
      t.belongs_to :recipe, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
