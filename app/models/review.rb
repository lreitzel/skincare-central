class Review < ApplicationRecord
    belongs_to :product
    belongs_to :user
    validates_presence_of :review_body, :rating
    # accepts_nested_attributes_for :products
    
    def product_attributes=(product)
        self.product = Product.find_or_create_by(name: product[:name])
        
    end

end
