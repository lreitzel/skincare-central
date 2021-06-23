class ProductsController < ApplicationController

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

    def product_params
        params.require(:product).permit(:name, :type, :brand, :price)
    end
    
end
