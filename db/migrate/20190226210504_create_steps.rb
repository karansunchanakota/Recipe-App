class CreateSteps < ActiveRecord::Migration[5.2]
  drop_table :steps
  
  def change
    create_table :steps do |t|
      t.references :recipe
      t.string :description, :limit=>200
      t.integer :sequence
    end
  end
end
