module Api
  class DreamsController < Api::BaseController

    private

      def dream_params
        params.require(:dream).permit(:date, :category, :description)
      end

      def query_params
        # this assumes that a dream belongs to a user and has an :user_id
        # allowing us to filter by this
        params.permit(:user_id, :date, :category, :description)
      end

  end
end
