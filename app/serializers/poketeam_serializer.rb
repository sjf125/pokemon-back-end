class PoketeamSerializer < ActiveModel::Serializer
  attributes :id, :slot1, :slot2, :slot3, :slot4, :slot5, :slot6
  has_one :user
end
