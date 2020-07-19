class AddingPoolToTokenAssc < ActiveRecord::Migration[5.2]
  def change
    add_reference :pool_tokens, :pool
  end
end
