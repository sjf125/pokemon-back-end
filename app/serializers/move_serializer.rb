class MoveSerializer < ActiveModel::Serializer
  attributes :id, :name, :type, :pp, :power, :accuracy, :effect
end
