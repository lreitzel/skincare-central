class ReviewsController < ApplicationController

    def index #do we want a page with all the reviews? Should probably just be on the products/index page
    end

    def new #form should be nested so that we can create a product(or choose from one) at the same time
        @review = Review.new(product_id: params[:product_id])
    end

    def create
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
        params.require(:review).permit(:rating, :review_body, :image, :product_id)
    end
end
