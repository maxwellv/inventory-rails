class Jewelry < ActiveRecord::Base
  has_one :owner, through: :ownerships
end
