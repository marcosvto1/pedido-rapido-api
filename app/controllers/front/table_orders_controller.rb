module Front
  class TableOrdersController < ApiController
    attr_reader :tables

    def index
      config = AdminConfiguration.first
      @tables = []
      map_status_each_table config.table_quantity
      render json: {
        tables: tables,
      }
    end

    def orders
      @order = Order.where(status: 1, table: params[:table_id])
      render json: @order.to_json
    end

    private

    def map_status_each_table(table_quantity = 4)
      (1..table_quantity).each do |table|
        order = Order.where(table: table).last
        new_table = { table: table, order: nil, status: "available" }
        if order.present? && order.status != "finish" && order.status != "canceled"
          items = []
          if order.order_items.count > 0
            order.order_items.each do |order_item|
              item = {
                id: order_item.id,
                quantity: order_item.quantity,
                product: order_item.product,
              }
              items << item
            end
          end
          new_table = { table: table, order: { id: order.id, status: order.status, items: items }, status: "in_user" }
        end
        @tables.push (new_table)
      end
    end
  end
end
