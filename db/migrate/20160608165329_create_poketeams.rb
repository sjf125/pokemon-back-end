class CreatePoketeams < ActiveRecord::Migration
  def change
    create_table :poketeams do |t|
      t.string :slot1
      t.string :slot2
      t.string :slot3
      t.string :slot4
      t.string :slot5
      t.string :slot6
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
