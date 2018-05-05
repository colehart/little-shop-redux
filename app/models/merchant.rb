# Merchant class
class Merchant < ActiveRecord::Base
  validates_presence_of :name
end
