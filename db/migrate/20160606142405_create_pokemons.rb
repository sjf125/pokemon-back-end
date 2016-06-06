class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :type1
      t.string :type2
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :special-attack
      t.integer :special-defense
      t.integer :speed

      t.timestamps null: false
    end
  end
end
