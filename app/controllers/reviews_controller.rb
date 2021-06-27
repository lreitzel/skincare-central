class ReviewsController < ApplicationController
    before_action :set_current_user, only: [:new, :create]

    def index #do we want a page with all the reviews? Should probably just be on the products/index page
    end

    def new #form should be nested so that we can create a product(or choose from one) at the same time
        @review = Review.new
        @review.build_product
    end

    def create
        # binding.pry
        @review = Review.new(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def review_params
        params.require(:review).permit(:rating, :review_body, :image, :user_id, :product_id, product_attributes: [:name, :category, :brand, :price])
    end
end
