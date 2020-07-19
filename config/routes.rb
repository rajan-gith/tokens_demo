Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      get 'pools', to: 'pools#index'
      get 'pools/:pool_id/tokens', to: 'pool_tokens#index'
      post 'pools/:pool_id/tokens', to: 'pool_tokens#create'
      delete 'pools/:pool_id/tokens/:token_id', to: 'pool_tokens#delete'
      patch 'pools/:pool_id/tokens/:token_id/assign/', to: 'pool_tokens#assign'
      patch 'pools/:pool_id/tokens/:token_id/unblock', to: 'pool_tokens#unblock'
      patch 'pools/:pool_id/tokens/:token_id/keep_alive', to: 'pool_tokens#keep_alive'
    end
  end
end
