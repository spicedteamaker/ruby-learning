require "./Item.rb"
class Weapon < Item

	def initialize(name, damage_value)
		@name = name
		@damage_value = damage_value
	end

	def get_item_info
		return "#{@name}, damage: #{@damage_value}"
	end

end
