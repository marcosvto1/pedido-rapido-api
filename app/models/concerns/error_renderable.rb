module ErrorRenderable
  extend ActiveSupport::Concern

  included do
    class_attribute :error_partial

    def render_error(message: nil, fields: nil, status: :unprocessable_entity)
      render partial: self.class.error_partial, locals: { message: message, fields: fields }, status: status
    end
  end
end
