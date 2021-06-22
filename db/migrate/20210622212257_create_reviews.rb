class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :rating
      t.string :review_body
      t.string :image

      t.timestamps
    end
  end
end
