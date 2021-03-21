class CreateGuitars < ActiveRecord::Migration[5.2]
  def change
    create_table :guitars do |t|
      t.string :maker
      t.string :model_name
      t.string :color
      t.integer :year_created
      t.string :image_url
    end
  end
end
