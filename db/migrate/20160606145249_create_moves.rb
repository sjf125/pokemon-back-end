class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :name
      t.string :type
      t.integer :pp
      t.integer :power
      t.integer :accuracy
      t.text :effect

      t.timestamps null: false
    end
  end
end
