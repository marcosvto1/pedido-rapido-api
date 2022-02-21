module Admin
  class DashboardController < ApiController
    def index
      date = params[:data]
      day = Time.now
      if params[:date]
        day = Date.parse(params[:date])
      end
      min_date = day.beginning_of_day
      max_date = day.end_of_day

      orders_finish = Order.where(created_at: min_date..max_date, status: :finish)
        .joins(:order_items)
        .includes(order_items: [:product])

      orders_canceled = Order.where(created_at: min_date..max_date, status: :canceled)
        .joins(:order_items)
        .includes(order_items: [:product])

      orders_opened = Order.where(created_at: min_date..max_date, status: [:opened, :in_progress, :ready])
        .joins(:order_items)
        .includes(order_items: [:product])

      render json: {
        orders_finished: {
          qtd: orders_finish.distinct.count,
          billing: orders_finish.sum("price * quantity"),
        },
        orders_canceled: {
          qtd: orders_canceled.distinct.count,
          billing: orders_canceled.sum("price * quantity"),
        },
        orders_opened: {
          qtd: orders_opened.distinct.count,
          billing: orders_opened.sum("price * quantity"),
        },
      }
    end
  end
end
