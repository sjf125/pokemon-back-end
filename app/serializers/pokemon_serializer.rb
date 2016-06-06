class PokemonSerializer < ActiveModel::Serializer
  attributes :id, :name, :type1, :type2, :hp, :attack, :defense, :spatk, :spdef, :speed, :pokedex_id
end
