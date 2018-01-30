module WorldText

	def WorldText.text(textType, action)
		case textType
		when "game master"
			game_master_text(action)
		when "bathroom"
			bathroom_text(action)
		when "crew quarters"
			crew_quarters_text(action)
		else
			puts "ERROR: Invalid text type passed"
			exit(1)
		end

	end

	def WorldText.game_master_text(action)
		text = {
			"game intro" =>
				"The year is 2433. You are an engineer aboard the USS Eclyptico, the\nflagship of Conglomerate Interstellar. You recall the mission briefing\nfrom well over six months ago. \n=-=-=-=-=-=\nMission: Forward Grasp\nSummary: Explore two parsecs outside of Conglomerate space\nReason: Intercepted radio waves from unknown source; possibility of intelligent life\n=-=-=-=-=-=",

				"intro" =>
				"Your shower has just finished, you look into the mirror and let out a\nsigh of relief. Another long day down in Engineering. Peterson was\ngetting onto you about some numbers, but now you can relax, get\nyour book out, and think about home. About Earth. Claire is only a\nfew billion kilometers from you, it isn't so bad. You let out a\nsmall chuckle, imagining to yourself how far away that really is.",

				"leave bathroom event" =>
				"*BANG* You take your hand off the knob and take a step back.\n'SOMEBODY! HELP ME!'\nThat's Peterson's voice! You try to open\nthe door, but something is blocking it. A gutteral clicking is\nheard, there's something out there with him!",

				"bathroom leave fail" =>
				"It's no use, you're going to have to kick it down!",

				"crew quarters peterson event" =>
				"'Help me! please! it's got me!' \nWhat is this thing?! Peterson is being attacked by some..alien, insectoid\ncreature! There is a constant, erratic clicking, and the giant insect has\none of its apendages sticking into Peterson's leg, his blood\ncoating the floor below.",

				"help peterson event" =>
				"You grab a nearby wrench, intent on smashing whatever that disgusting\nbug is. But before you could make any attempt to save\nPeterson, the giant insect jumps through the ceiling, taking\nPeterson with it! Good God, there's blood everywhere. . .",

				"help peterson event attempt" =>
				"Peterson can't be helped anymore, that...thing...took him somewhere.",

				"crew quarters after peterson" =>
				"With the insect gone, now might be a good time to take a breather and\nget your bearing straight. You're in the crew quarters, there are\nbunk beds lining the walls, and footlockers against each of them,\nyours in particular is a shaded green. The other engineers\naren't anywhere to be found, just what the hell is going on\nhere?"
		}

		puts "_"
		return text[action]

	end
	def WorldText.bathroom_text(action)
		text = {
			"first entry" =>
			"The crew's bathroom area is a mess. Luckily you've kept your section\ngenerally clean. Your toilet has a few stains on it, and your\nmirror could use a quick wash, but they're nothing like O'Brien's\narea. The sink drips quietly, giving you time to take in the\nrelative peace. ",

			"enter bathroom" =>
			"You go back into the restroom. The sink is still dripping, and the toilet and mirror are still relatively clean considering.",

			"kick door" =>
			"You kick the door hard, the door swings open and a metal rod blocking it is\nblown back by the force.",

			"wash hands" =>
			"You turn the sink on and give your hands a nice scrub.",

			"flush toilet" =>
			"The toilet water spins as it goes down the drain.",

			"inspect mirror" =>
			"You could definitely use a shave, Claire wouldn't have you walking in\npublic with this much fur on you.",

			"leave" =>
			"You open the door and walk out."
		}
		puts "_"
		return text[action]
	end

	def WorldText.crew_quarters_text(action)
		text = {

			"help peterson first" =>
			"I need to help peterson first!",

			"inspect footlocker first" =>
			"You find your old ship map given to you during training. It seems so small when it's drawn up like this. You take the map and place it into your shirt pocket.",

			"inspect footlocker multiple" =>
			"The only thing left in there is some peanut butter and crackers, both of which would seem appetizing had today been normal"

		}
		puts "_"
		return text[action]
	end
end
