class AddPokedexToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemons, :pokedex_id, :integer
  end
end
