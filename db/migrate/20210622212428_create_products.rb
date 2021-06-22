class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :type
      t.string :brand
      t.string :price

      t.timestamps
    end
  end
end
