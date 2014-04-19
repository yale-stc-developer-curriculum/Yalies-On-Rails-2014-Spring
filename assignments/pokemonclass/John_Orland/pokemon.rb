require 'active_record'

class Pokemon < ActiveRecord::Base

  #active_record automatically gives us CRUD methods - create, read, update, destroy
  #We could optionally include validation code here
  attr_accessor :name, :current_health, :max_health,
		:defense, :attack, :cry,
                :strength, :speed, :focus, :pp


  def cry
    puts "Wahhh..."
  end

  def damage amount
    @current_health = @current_health.to_i - amount
  end

  def full_heal 
    @current_health = @max_health
  end

  
end
