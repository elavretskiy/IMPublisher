module Api
  module V1
    class MarkersController < API::V1::ApiController
      respond_to :json

      def index
        @markers = Marker.last(5)
        render :index
      end
    end
  end
end
