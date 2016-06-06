class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score
      t.belongs_to :pokemon
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
