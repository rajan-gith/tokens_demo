class AddingReservedAtField < ActiveRecord::Migration[5.2]
  def change
    add_column :pool_tokens, :reserved_at, :datetime
  end
end
