# Item class
class Item < ActiveRecord::Base
  validates_presence_of :title, :description

end
