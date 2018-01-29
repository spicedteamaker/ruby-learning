require "./Inventory.rb"

class Player
	def initialize(player_name, player_location)
		@player_name = player_name
		@player_location = player_location
		@player_inventory = Inventory.new
	end

	def get_player_name
		return @player_name
	end

	def get_location
		return @player_location
	end

	def set_location(room)
		@player_location = room
	end

	def inventory
		return @player_inventory
	end

end
