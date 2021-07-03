class Review < ApplicationRecord
    belongs_to :product
    belongs_to :user
    validates_presence_of :review_body, :rating

    RATING = [
        "1", "2", "3", "4", "5"
    ]


end
