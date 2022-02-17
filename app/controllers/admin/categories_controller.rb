module Admin
    class CategoriesController < ApiController
      def index
        @categories = Category.all
      end

      def show
        @category = Category.find(params[:id])
      end
  
      def update
        @category = Category.find(params[:id])
        @category.attributes = category_params
        save_category!
      end
  
      def create
        @category = Category.new(category_params)
        save_category!
      end

      private
  
      def save_category!
        @category.save!
        render :show
      rescue
        render_error fields: @category.errors.messages
      end
  
      def category_params
        params.require(:category).permit(:title, :status, :image)
      end
    end
  end
  