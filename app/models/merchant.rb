# Merchant model
class Merchant < ActiveRecord::Base
  validates_presence_of :name
end
