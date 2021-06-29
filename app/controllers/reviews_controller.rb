class ReviewsController < ApplicationController
    before_action :set_current_user, only: [:new, :create]

    def index #do we want a page with all the reviews? Should probably just be on the products/index page
        @reviews = Review.all
    end

    def new #form should be nested so that we can create a product(or choose from one) at the same time
        # binding.pry
        @review = Review.new
        @review.build_product
    end

    def create
        # binding.pry
        @review = Review.new(review_params)
        if @review.product
            if @review.save
                redirect_to review_path(@review)
            else
                render :new
            end
        end
    end

    def show
        @review = Review.find_by(id: params[:id])
    end

    def edit
        @review = Review.find_by(id: params[:id])
    end

    def update
        @review = Review.find_by(id: params[:id])
        @review.update(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :edit
        end
    end

    def destroy
        @review = Review.find_by(id: params[:id])
        @review.delete
        redirect_to reviews_path
    end

    private

    def review_params
        params.require(:review).permit(:rating, :review_body, :image, :user_id, :product_id, product_attributes: [:name, :category, :brand, :price])
    end
end
