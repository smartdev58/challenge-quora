module Api
  module V1
    module Users
      class SessionsController < Devise::SessionsController
        respond_to :json

        private

        def respond_with(resource, _opts = {})
          render json: { message: 'OK' }, status: :ok
        end

        def respond_to_on_destroy
          if current_user.present?
            render json: { message: 'Success' }, status: :ok
          else
            render json: { message: 'Failed'}, status: :unauthorized
          end
        end
      end
    end
  end
end
