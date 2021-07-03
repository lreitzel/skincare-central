class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update]
    before_action :require_login, only: [:new, :edit]

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
        if @product.nil?
            redirect_to products_path
        else
            render :show
        end
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

    def product_category
        @cleansers = Product.product_category("Cleanser")
        @moisturizers = Product.product_category("Moisturizer")
    end

    def destroy #maybe shouldn't be allowed because others may want to use this product
    end

    private

    def product_params
        params.require(:product).permit(:name, :category, :brand, :price)
    end    
end
