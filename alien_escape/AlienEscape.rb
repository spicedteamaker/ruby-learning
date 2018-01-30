require "./Player.rb"
require "./Weapon.rb"
require "./Key.rb"
require "./Room.rb"
require "./Door.rb"
require "./Armor.rb"
require "./PlayerInput.rb"
require "./WorldText.rb"
require "./Tool.rb"

class AlienEscape

	def initialize
		start_game
	end

	def start_game
		game_items = generate_items
		map = generate_doors(generate_room_adjacency(generate_rooms))
		map_items = generate_items
		player_name = PlayerInput.start_menu
		player = Player.new(player_name, map["bathroom"])
		puts WorldText.text("game master", "game intro")
		puts WorldText.text("game master", "intro")
		puts WorldText.text("bathroom", "first entry")
		PlayerInput.loop(player, map, map_items)

	end

	def generate_rooms
		room_list = {}
		# first floor
		room_list["bathroom"] = Room.new("Bathroom")
		room_list["crew quarters"] = Room.new("Crew Quarters")
		room_list["rec room"] = Room.new("Rec Room")
		room_list["gym"] = Room.new("Gym")
		room_list["mess hall"] = Room.new("Mess Hall")
		room_list["garden"] = Room.new("Garden")
		room_list["kitchen"] = Room.new("Kitchen")
		room_list["first corridor"] = Room.new("Corridor")
		room_list["elevator"] = Room.new("Elevator")

		# second floor
		room_list["second corridor"] = Room.new("Second Corridor")
		room_list["armory"] = Room.new("Armory")
		room_list["engineering"] = Room.new("Engineering")
		room_list["main engine room"] = Room.new("Main Engine Room")
		room_list["storage bay"] = Room.new("Storage Bay")
		room_list["med bay"] = Room.new("Med Bay")
		room_list["docking station"] = Room.new("Docking Station")
		room_list["quarantine"] = Room.new("Quarantine")
		room_list["airlock"] = Room.new("Airlock")

		# third floor
		room_list["bridge"] = Room.new("Bridge")
		room_list["escape pods"] = Room.new("Escape Pods")

		return room_list

	end

	def generate_room_adjacency(room_list)
		# first floor
		room_list["bathroom"].set_adjacent_rooms({1 => room_list["crew quarters"]})
		room_list["crew quarters"].set_adjacent_rooms({1 => room_list["bathroom"],
			2 => room_list["mess hall"],
			3 => room_list["rec room"]})
		room_list["mess hall"].set_adjacent_rooms({1 => room_list["garden"],
			2 => room_list["kitchen"]})
		room_list["kitchen"].set_adjacent_rooms({1 => room_list["mess hall"]})
		room_list["garden"].set_adjacent_rooms({1 => room_list["mess hall"],
			2 => room_list["first corridor"]})
		room_list["rec room"].set_adjacent_rooms({1 => room_list["gym"],
			2 => room_list["first corridor"]})
		room_list["first corridor"].set_adjacent_rooms({1 => room_list["rec room"],
			2 => room_list["garden"],
			3 => room_list["elevator"]})
		room_list["elevator"].set_adjacent_rooms({1 => room_list["first corridor"],
			2 => room_list["second corridor"],
			3 => room_list["bridge"]})

		# second floor
		room_list["second corridor"].set_adjacent_rooms({1 => room_list["armory"],
			2 => room_list["engineering"],
			3 => room_list["med bay"],
			4 => room_list["storage bay"],
			5 => room_list["quarantine"],
			6 => room_list["elevator"]})
		room_list["armory"].set_adjacent_rooms({1 => room_list["second corridor"]})
		room_list["engineering"].set_adjacent_rooms({1 => room_list["second corridor"],
			2 => room_list["main engine room"]})
		room_list["main engine room"].set_adjacent_rooms({1 => room_list["engineering"]})
		room_list["storage bay"].set_adjacent_rooms({1 => room_list["second corridor"],
			2 => room_list["docking station"]})
		room_list["docking station"].set_adjacent_rooms({1 => room_list["storage bay"]})
		room_list["med bay"].set_adjacent_rooms({1 => room_list["second corridor"]})
		room_list["quarantine"].set_adjacent_rooms({1 => room_list["second corridor"],
			2 => room_list["airlock"]})

		# third floor
		room_list["bridge"].set_adjacent_rooms({1 => room_list["elevator"],
			2 => room_list["escape pods"]})
		room_list["escape pods"].set_adjacent_rooms({1 => room_list["bridge"]})

		return room_list
	end

	def generate_doors(room_list)
		# armoryis locked, needs key found in engineering
		room_list["second corridor"].set_doors(Door.new("armory", true, @armory_key))
		#main engine room is locked from the bridge
		room_list["engineering"].set_doors(Door.new("main engine room", true, @main_engine_key))
		#kitchen is locked, needs key from a person in the medical bay
		room_list["mess hall"].set_doors(Door.new("kitchen", true, @kitchen_key))
		return room_list
	end

	def generate_items
		map_items = {
			"armory key" => Key.new("armory key"),
			"kitchen key" => Key.new("kitchen key"),
			"main engine door control card" => Key.new("main engine door control card"),
			"Phil's laser pistol" => Weapon.new("Phil's laser pistol", 20),
			"laser rifle" => Weapon.new("laser rifle", 25),
			"handy wrench" => Weapon.new("handy wrench", 5),
			"Macie's knife of butchery" => Weapon.new("Macie's knife of butchery", 15),
			"small hammer" => Weapon.new("small hammer", 5),
			"Explode-O-Matic 6000" => Weapon.new("Explode-O-Matic 6000", 50),
			"toy Explode-O-Matic 6000" => Weapon.new("toy Explode-O-Matic 6000", 1),
			"military-grade suit" => Armor.new("military-grade suit"),
			"space pajamas" => Armor.new("space pajamas"),
			"hazmat suit" => Armor.new("hazmat suit"),
			"map" => Tool.new("map")}

		return map_items

	end

	def create_player(player_name)
		return player = Player.new(player_name)
	end

	def output(string)
		puts string
	end

	def input
		print "> "
		return $stdin.gets.chomp(' ')
	end

	# TODO generate weapons, generate player, everything else

end

game = AlienEscape.new
