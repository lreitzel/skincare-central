class Product < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    validates_presence_of :name, :brand, :price, :category
    validates_uniqueness_of :name

    # scope: products_of_one_brand ->(skincare_brand) { where(brand: skincare_brand) }
    # scope: most_reviewed_product ->()
    # scope :highest_rated, ->(rate) {where("reviews.rating = ?", rate)}

    scope :product_category, ->(product_type) {where("category = ?", product_type)}

    PRICE = ["$", "$$", "$$$"]

    CATEGORY = ["Cleanser", "Moisturizer", "Serum", "Spray", "Sunscreen", "Toner", "Exfoliant", "Other"]

end
