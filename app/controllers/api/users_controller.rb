module Api
  class UsersController < Api::BaseController

    private

      def user_params
        params.require(:user).permit(:name, :age, :city, :state)
      end

      def query_params
        params.permit(:name, :age, :city, :state)
      end

  end
end
