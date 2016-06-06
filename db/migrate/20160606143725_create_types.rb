class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name
      t.has_and_belongs_to_many :pokemon
      t.has_and_belongs_to_many :moves

      t.timestamps null: false
    end
  end
end
