module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response(
        {
          errors: [e.message]
        },
        :not_found
      )
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response(
        {
          errors: e.record.errors.full_messages
        },
        :unprocessable_entity
      )
    end

    rescue_from ArgumentError do |e|
      json_response(
        {
          errors: [e.message]
        },
        :unprocessable_entity
      )
    end
  end
end
