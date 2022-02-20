module Front
  class ProductsController < ApiController
    def index
      @products = Product.where(status: 1, category_id: params[:category_id])
    end
  end
end
