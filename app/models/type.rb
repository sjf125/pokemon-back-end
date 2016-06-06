class Type < ActiveRecord::Base
  belongs_to :pokemons, inverse_of: :types
  belongs_to :moves, inverse_of: :types
end
