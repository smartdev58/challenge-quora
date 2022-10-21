module Api
  module V1
    module Users
      class RegistrationsController < Devise::RegistrationsController
        respond_to :json

        private

        def respond_with(resource, _opts = {})
          if resource.persisted?
            render json: { message: 'OK' }, status: :ok
          else
            render json: { message: 'Email id already exist'}, status: :ok
          end
        end
      end
    end
  end
end
