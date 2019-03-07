class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.references :recipe
      t.string :item, :limit=>100
      t.integer :sequence
    end
  end
end
