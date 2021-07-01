class Product < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    validates_presence_of :name, :brand

    # scope: products_of_one_brand ->(skincare_brand) { where(brand: skincare_brand) }
    # scope: most_reviewed_product ->()

    PRICE = ["$", "$$", "$$$"]

end
