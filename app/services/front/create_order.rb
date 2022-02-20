module Front
  class CreateOrder
    class NotCreatedOrderError < StandardError; end

    attr_reader :errors

    def initialize(params)
      @order = Order.new
      @order_items_params = params[:items]
      @errors = {}
    end

    def call
      Order.transaction do
        @order.attributes = @params.reject { |key| key === :items }
        build_order_items
      ensure
        save!
      end
    end

    def build_order_items
      @order.order_items.attributes = @order_items_params
    end

    def save!
      save_record!(@order)
      raise NotCreatedOrderError if @errors.present?
    rescue => e
      raise NotCreatedOrderError
    end

    def save_record!(record)
    rescue ActiveRecord::RecordInvalid
      @errors.merge!(record.errors.messages)
    end
  end
end
