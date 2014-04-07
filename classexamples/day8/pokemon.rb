require 'active_record'

class Pokemon < ActiveRecord::Base

  #active_record automatically gives us CRUD methods - create, read, update, destroy
  #We could optionally include validation code here
  validates_presence_of :name

end
