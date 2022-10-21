module Users
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(resource, _opts = {})
      if valid_credentials?
        render json: { message: 'OK' }, status: :ok
      else
        render json: { message: 'Could not confirm credentials' }, status: :ok
      end
    end

    def respond_to_on_destroy
      if current_user.present?
        render json: { message: 'Success' }, status: :ok
      else
        render json: { message: 'Failed' }, status: :unauthorized
      end
    end

    def valid_credentials?
      @user = User.find_by!(email: params[:user][:email])
      raise StandardError, 'Invalid Password' unless @user.valid_password?(params[:user][:password])

      true
    rescue StandardError => e
      @error_message = e.message
      false
    end
  end
end
