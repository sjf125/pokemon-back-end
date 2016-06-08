class Poketeam < ActiveRecord::Base
  belongs_to :user, inverse_of: :poketeams
end
