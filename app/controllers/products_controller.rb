class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end 

  def new
    @product = Product.new
    #@categories = Category.all
    @all_categories = Category.all
    @categories = @product.categories

  end

def create
    @product = Product.new(product_params)
    byebug
      if @product.save
          redirect_to @product
        else
          render :new
      end
end

  def edit
      @product = Product.find(params[:id])
      @all_categories = Category.all
      @categories = @product.categories
    end

    def update
       @product = Product.find(params[:id])
       if @product.update(product_params)
         redirect_to @product
       else
         render :edit
       end
     end

     def destroy
        product = Product.find(params[:id])
        product.destroy

        redirect_to products_path
      end

  private
      def product_params
        params.require(:product).permit(:name, :price, category_ids:[])
      end
  end
