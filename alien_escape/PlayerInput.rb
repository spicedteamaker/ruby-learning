require "./WorldText.rb"

module PlayerInput
	@BATHROOM_EVENT = true

	def PlayerInput.loop(player)
		@player = player
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
		verbs = ["inspect", "wash", "flush", "exit", "kick", "enter", "go", "leave"]
		nouns = ["", "door", "mirror", "toilet", "sink", "hands"]
		input = input.downcase
		input = input.split(' ')

		if input.length.eql? 1
			if verbs.include? input[0]
				parse_verb_and_noun(input, true)
			else puts "_\nI don't want to do that"
			end
		elsif (verbs.include? input[0]) && (nouns.include? input[1]) then parse_verb_and_noun(input, false) else puts "_\nI don't want to do that." end

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
		scripted_event = check_event(action)
		if scripted_event != nil
			puts scripted_event
		else
			puts WorldText.text(location, action)
		end
	end

	#manually overriden events
	def PlayerInput.check_event(action)
		#scripted leave bathroom event
		if (action.eql? "leave") && (@BATHROOM_EVENT)
			@BATHROOM_EVENT = false
			return WorldText.text("game master", "leave bathroom event")
		end
	end
end
