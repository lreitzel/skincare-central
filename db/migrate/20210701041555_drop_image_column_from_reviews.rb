class DropImageColumnFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :image, :string
  end
end
