require "./src/WorldText.rb"
require "./src/Dictionary.rb"

module PlayerInput
	# these are all global variables to check when we want a scripted event to occur
	# everything to do with peterson in Crew Quarters
	@BATHROOM_EVENT = true
	@DOOR_KICKED = false
	@PETERSON_SCREAMED = false
	@PETERSON_SEEN = false
	@PETERSON_HELPED = false
	@FOOTLOCKER_INSPECTED = false
	@HAS_MAP = false

	def PlayerInput.loop(player, map, items)
		@player = player
		@map = map
		@items = items
		input = " "
		while true
			print "> "
			input = $stdin.gets.chomp("")
			break if input.eql? "quit"
			evaluate_input(input)
		end
	end

	def PlayerInput.start_menu
		player_name = " "
		while true
			puts "Who are you?"
			print "> "
			player_name = $stdin.gets.chomp("")
			puts "Your name is #{player_name}. Are you sure? [yes/no]"
			print "> "
			sureness = $stdin.gets.chomp("")
			if sureness.eql? "yes" then break end
			end
			return player_name
	end

	def PlayerInput.evaluate_input(input)
		location = @player.get_location.get_room_name.downcase
		input = input.downcase
		input = input.split(' ')

		if input.length.eql? 1
			check = check_commands(input[0])
			if !check.nil?
				puts check
				return nil
			end
		end

		if input.length.eql? 1
			puts "input length is 1"
			if Dictionary.check_verbs?(location, input[0])
				parse_verb_and_noun(input, true)
			else puts "_\nI don't want to do that"
			end
		elsif (Dictionary.check_verbs?(location, input[0])) && (Dictionary.check_nouns?(location, input[1])) then parse_verb_and_noun(input, false) else puts "_\nI don't want to do that." end

	end

	def PlayerInput.parse_verb_and_noun(input, verb_only)
		location = @player.get_location.get_room_name.downcase
		verb = input[0]
		if verb_only
			action = "#{verb}"
		else
			noun = input[1]
			action = "#{verb} #{noun}"
		end
		scripted_event = []
		scripted_event = check_event(action)

		if scripted_event[0] != nil
			puts scripted_event[0]
			if scripted_event.length >= 2
				puts "[ENTER]"
				$stdin.gets
				puts scripted_event[1]
			end
		else
			puts WorldText.text(location, action)
		end

		check_room_change(action)
		puts @player.get_location.get_room_name
	end

	# manually overriden events
	def PlayerInput.check_event(action)
		case @player.get_location.get_room_name.downcase
		when "bathroom"
		# scripted leave bathroom event, player must kick door down
			if (action.eql? "leave") && (!@DOOR_KICKED) && (!@PETERSON_SCREAMED)
				@PETERSON_SCREAMED = true
				return [WorldText.text("game master", "leave bathroom event")]
			elsif (action.eql? "leave") && (!@DOOR_KICKED) && (@PETERSON_SCREAMED)
				return [WorldText.text("game master", "bathroom leave fail")]
			else
				return [nil]
		end
	when "crew quarters"
		# tries to help peterson, but fails, acquires the wrench item
			if (action.eql? "help peterson") && (!@PETERSON_HELPED)
				@PETERSON_HELPED = true
				@player.inventory.loot_item(@items["handy wrench"])
				return [WorldText.text("game master", "help peterson event"), WorldText.text("game master", "crew quarters after peterson")]
			elsif (action.eql? "help peterson") && (@PETERSON_HELPED)
				return [WorldText.text("game master", "help peterson event attempt")]
				# player should probably help peterson, he's in danger
			elsif (!action.eql? "help peterson") && (!@PETERSON_HELPED)
				return [WorldText.text("crew quarters", "help peterson first")]
				# gets the map item, enables the use of seeing nearby rooms
			elsif (action.eql? "inspect footlocker") && (!@FOOTLOCKER_INSPECTED)
				@player.inventory.loot_item(@items["map"])
				@HAS_MAP = true
				@FOOTLOCKER_INSPECTED = true
				return [WorldText.text("crew quarters", "inspect footlocker first")]
			elsif (action.eql? "inspect footlocker") && (@FOOTLOCKER_INSPECTED)
				return [WorldText.text("crew quarters", "inspect footlocker multiple")]
			elsif (!action.eql? "inspect footlocker") && (!@HAS_MAP)
				return [WorldText.text("crew quarters", "inspect footlocker hint")]
			else
				return [nil]
			end
		else
			return [nil]
		end
	end

	def PlayerInput.check_room_change(action)

		case @player.get_location.get_room_name.downcase
			#bathroom room change events
		when "bathroom"
			if (action.eql? "leave") && (@DOOR_KICKED)
				@player.set_location(@map["crew quarters"])
			elsif (action.eql? "kick door") && (!@DOOR_KICKED)
				@DOOR_KICKED = true
				@player.set_location(@map["crew quarters"])
				# scripted event when player kicks the door down and sees peterson
				puts WorldText.text("game master", "crew quarters peterson event")
			end
		else
			puts "no room change"
		end
	end

	def PlayerInput.check_commands(command)
		if (command.eql? "help")
			return "[help, inventory]"
		elsif (command.eql? "inventory")
			return @player.inventory.show_inventory
		elsif (command.eql? "map")
			if @HAS_MAP
				nearby = @player.get_location.get_adjacent_rooms
				nearby_parsed = ""
				nearby.each do |room_number, adjacent|
					nearby_parsed += adjacent.get_room_name.downcase
					# TODO if there's only one room, remove the comma
					nearby_parsed += ", "
				end
			else
				return "I don't have a map yet."
			end
			return "The adjacent rooms are: #{nearby_parsed}"
		else
			return nil
		end
	end
end
