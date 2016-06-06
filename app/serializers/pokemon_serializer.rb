class PokemonSerializer < ActiveModel::Serializer
  attributes :id, :name, :type1, :type2, :hp, :attack, :defense, :"special-attack", :"special-defense", :speed
end
