class Player
	def initialize(player_name, player_location)
		@player_name = player_name
		@player_location = player_location
	end

	def get_player_name
		return @player_name
	end

	def get_location
		return @player_location
	end

end
