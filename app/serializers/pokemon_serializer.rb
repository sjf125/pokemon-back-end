class PokemonSerializer < ActiveModel::Serializer
  attributes :id, :name, :type1, :type2, :hp, :attack, :defense, :spatk, :spdef, :speed, :image, :pokedex_id
end
