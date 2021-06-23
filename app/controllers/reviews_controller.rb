class ReviewsController < ApplicationController

    def index
    end

    def new
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
        params.require(:review).permit(:rating, :review_body, :image)
    end
end
