class AddImageToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemons, :image, :string
  end
end
