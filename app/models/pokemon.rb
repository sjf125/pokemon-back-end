class Pokemon < ActiveRecord::Base
  has_many :types, inverse_of: :pokemon
  has_many :moves, inverse_of: :pokemon
  has_many :comments, inverse_of: :pokemon
  has_many :ratings, inverse_of: :pokemon
end
