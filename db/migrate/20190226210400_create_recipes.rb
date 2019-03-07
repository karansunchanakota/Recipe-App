class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title, :limit=>50
      t.integer :prep_time
      t.integer :cook_time
      t.integer :servings
      t.string :origin, :limit=>100
    end
  end
end
