class Pool < ApplicationRecord
  has_many :tokens, class_name: 'PoolToken'
end
