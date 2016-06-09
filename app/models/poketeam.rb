class Poketeam < ActiveRecord::Base
  belongs_to :user, inverse_of: :poketeam
end
