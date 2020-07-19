class CreatePoolTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :pool_tokens do |t|
      t.string :value

      t.timestamps
    end
  end
end
