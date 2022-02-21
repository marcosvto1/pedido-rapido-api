module Front
  class OrdersController < ApiController
    def index
      min_date = Time.now.beginning_of_day
      max_date = Time.now.end_of_day

      orders = Order.where(created_at: min_date..max_date).joins(:order_items).includes(:order_items)

      todo = orders.where(status: :opened)
      doing = orders.where(status: :in_progress)
      ready = orders.where(status: :ready)

      @records = {
        todo: todo,
        doing: doing,
        done: ready,
      }
    end

    def create
      @order = Order.new
      @order.attributes = order_params
      @order.save!
      render :show
    rescue ActiveRecord::RecordInvalid
      render_error fields: @order.errors.messages
    end

    def update
      @order = Order.find(params[:id])
      @order.attributes = order_params

      if @order.save
        render :show
      else
        render_error fields: @order.errors.messages
      end
    end

    private

    def order_params
      order_param = params.require(:order).permit(:table, :detail, :status, :employee_id, order_items_attributes: [:quantity, :product_id])
      order_param.merge!({ employee_id: current_employee.id })
      order_param
    end
  end
end
