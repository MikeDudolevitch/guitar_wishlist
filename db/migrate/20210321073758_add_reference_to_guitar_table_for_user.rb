class AddReferenceToGuitarTableForUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :guitars, :user
  end
end
