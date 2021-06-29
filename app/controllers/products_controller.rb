class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update]

    def index
        @products = Product.all
    end

    def new #should I just have reviews new be the place where we make a new product?
        @product = Product.new
    end

    def create #see above
        @product = Product.create(product_params)
        if @product.save
            redirect_to product_path(@product)
        else
            render :new
        end
    end

    def show #want to show/link to all reviews associated with the product
    end

    def edit #should this just be part of the nested review form?
    end

    def update #see above
        if @product.update(:product_params)
            redirect_to product_path(@product)
        else
            render :edit
        end
    end

    def destroy #maybe shouldn't be allowed because others may want to use this product
    end

    private

    def product_params
        params.require(:product).permit(:name, :category, :brand, :price, review_attributes: [:rating, :review_body, :image])
    end

    
    
end
