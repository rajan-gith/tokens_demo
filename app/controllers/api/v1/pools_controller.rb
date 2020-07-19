module Api
  module V1
    class PoolsController < MainController
      def index
        pools = Pool.all
        render json: {pools: ActiveModelSerializers::SerializableResource.new(pools, each_serializer: PoolSerializer)}
      end
    end
  end
end
