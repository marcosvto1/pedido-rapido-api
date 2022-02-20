module Front
  class CategoriesController < ApiController
    def index
      @categories = Category.where(status: 1)
    end
  end
end
