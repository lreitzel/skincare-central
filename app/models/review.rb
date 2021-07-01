class Review < ApplicationRecord
    belongs_to :product
    belongs_to :user
    validates_presence_of :review_body, :rating
    # accepts_nested_attributes_for :product, reject_if: proc {|attributes| attributes[:name].blank?}
    
    # def product_attributes=(attributes)
    #     if !attributes[:name].blank?
    #         self.product = Product.find_or_create_by(attributes)
    #    end
    # end

end
