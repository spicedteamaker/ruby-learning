class Room
	def initialize(room_name)
		@room_name = room_name
		@doors = nil
		@adjacent_rooms = nil
	end

	def set_doors(doors)
		@doors = doors
	end

	def get_doors
		return @doors
	end

	def set_item(items)

	end

	def set_aliens(aliens)

	end

	def set_adjacent_rooms(rooms)
		@adjacent_rooms = rooms
	end

	def get_adjacent_rooms
		return @adjacent_rooms
	end

	def get_room_name
		return @room_name
	end

end
