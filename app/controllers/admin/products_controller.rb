module Admin
  class ProductsController < ApiController
    def index
      @products = Product.like(:name, params[:q]).order(name: :asc)
    end

    def show
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])
      @product.attributes = product_params
      save_product!
    end

    def create
      @product = Product.new(product_params)
      save_product!
    end

    private

    def save_product!
      @product.save!
      render :show
    rescue
      render_error fields: @product.errors.messages
    end

    def product_params
      params.require(:product).permit(:name, :description, :category_id, :price,
                                      :time_to_prepare, :status, :image)
    end
  end
end
