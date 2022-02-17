class ApiController < ApplicationController
  # include Authenticable
  include ErrorRenderable

  self.error_partial = "shared/error"
end
