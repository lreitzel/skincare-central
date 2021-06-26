class ReviewsController < ApplicationController

    def index #do we want a page with all the reviews? Should probably just be on the products/index page
    end

    def new #form should be nested so that we can create a product(or choose from one) at the same time
        if params[:product_id]
            @review = Review.new(product_id: params[:product_id])
            @product = Product.find_by(id: params[:product_id])
        else
            @review = Review.new
        end
    end

    def create
        @review = Review.create(review_params)
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
        params.require(:review).permit(:rating, :review_body, :image, :product_id, product_attributes: [:name, :type, :brand, :price])
    end
end
