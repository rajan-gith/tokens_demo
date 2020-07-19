class PoolTokenSerializer < ActiveModel::Serializer
  def attributes(*args)
    data = super
    data[:id] = object.id
    data[:value] = object.value
    data
  end
end
