module Api
  module V1
    class PoolTokensController < MainController
      before_action :select_pool
      before_action :select_token, only: [:assign, :unblock, :keep_alive, :delete]
      def index
        tokens = @pool.tokens.where('reserved_at < ?', Time.now - 5.minutes).destroy_all
        tokens = @pool.tokens.where(reserved_at: nil)
        render json: {tokens: ActiveModelSerializers::SerializableResource.new(tokens, each_serializer: PoolTokenSerializer)}
      end

      def create
        token = @pool.tokens.create(value: SecureRandom.hex)
        render json: { message: "Token created", token: PoolTokenSerializer.new(token), status: 201}
      end

      def assign
        @token.update(reserved_at: Time.now)
        render json: { message: "Token assigned", status: 201}
      end

      def unblock
        @token.update(reserved_at: nil)
        render json: { message: "Token unblocked", status: 201}
      end

      def keep_alive
        if @token.reserved_at < Time.now + 60.seconds
          render json: { message: "Token keep alive time expired", status: 201}
        else
          @token.update(reserved_at: Time.now)
          render json: { message: "Token validity extended", status: 201}
        end
      end

      def delete
        @token.destroy
        render json: { message: "Token deleted", status: 202}
      end

      private
      def select_pool
        @pool = Pool.find_by(id: params[:pool_id])
        unless @pool
          render json: { error: "Pool not found", status: 404 } and return
        end
      end
      def select_token
        @token = @pool.tokens.find_by(id: params[:token_id])
        unless @token
          render json: { error: "Token not found", status: 404 } and return
        end
      end
    end
  end
end
