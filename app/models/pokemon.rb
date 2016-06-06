class Pokemon < ActiveRecord::Base
  has_many :types
  has_many :moves
end
