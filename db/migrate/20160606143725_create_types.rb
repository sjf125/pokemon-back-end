class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name
      t.belongs_to :pokemons
      t.belongs_to :moves

      t.timestamps null: false
    end
  end
end
