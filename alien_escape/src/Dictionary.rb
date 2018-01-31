module Dictionary

	def Dictionary.check_verbs?(room, verb)
		puts "checking verb: #{verb}"
		case room
		when "bathroom"
			puts "player is in bathroom"
			verbs = ["inspect", "wash", "flush", "exit", "kick", "leave"]
			return verbs.include? verb
		when "crew quarters"
			verbs = ["inspect", "help"]
			return verbs.include? verb
		else return false
		end
	end

		def Dictionary.check_nouns?(room, noun)
			puts "checking noun: #{noun}"
			case room
			when "bathroom"
				nouns = ["door", "mirror", "toilet", "sink", "hands"]
				return nouns.include? noun
			when "crew quarters"
				nouns = ["peterson", "footlocker"]
				return nouns.include? noun
			else return false
			end
		end

end
