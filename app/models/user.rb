#
class User < ActiveRecord::Base
  include Authentication
  has_many :examples
  has_one :poketeam
  has_many :comments
end
