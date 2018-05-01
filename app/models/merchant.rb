# Merchant class
class Merchant < ActiveRecord::Base
  validates :name, presence: true
end
