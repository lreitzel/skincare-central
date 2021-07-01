class Review < ApplicationRecord
    belongs_to :product
    belongs_to :user
    validates_presence_of :review_body, :rating


end
