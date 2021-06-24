class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update]

    def index
        @products = Product.all
    end

    def new #should I just have reviews new be the place where we make a new product?
    end

    def create #see above
    end

    def show #want to show/link to all reviews associated with the product
    end

    def edit #should this just be part of the nested review form?
    end

    def update #see above
    end

    def destroy #maybe shouldn't be allowed because others may want to use this product
    end

    private

    def product_params
        params.require(:product).permit(:name, :type, :brand, :price)
    end

    def set_product
        @product = Product.find_by(id: params[:product][:id])
    end
    
end
