class ReviewsController < ApplicationController
    before_action :set_current_user, only: [:new, :create, :edit, :update]
    before_action :set_review, only: [:show, :edit, :update, :destroy]

    def index
        if params[:product_id] && @product = Product.find(params[:product_id])
            @reviews = @product.reviews
        else
            @reviews = Review.all
        end
    end

    def new #form should be nested so that we can create a product(or choose from one) at the same time
        if params[:product_id] && @product = Product.find(params[:product_id])
            @review = Review.new(product_id: params[:product_id])
        else
            @review = Review.new
        end
    end

    def create
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
        @review.update(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :edit
        end
    end

    def destroy
        @review.delete
        redirect_to reviews_path
    end

    private

    def review_params
        params.require(:review).permit(:rating, :review_body, :image, :user_id, :product_id)
    end
end
