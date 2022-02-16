module Admin
  class ConfigurationsController < ApiController
    def show
      @configuration = AdminConfiguration.find(params[:id])
    end

    def update
      @configuration = AdminConfiguration.find(params[:id])
      @configuration.attributes = configuration_params
      save_configuration!
    end

    private

    def save_configuration!
      @configuration.save!
      render :show
    rescue
      render_error fields: @configuration.errors.messages
    end

    def configuration_params
      params.require(:configuration).permit(:name, :table_quantity, :start_at, :finish_at)
    end
  end
end
