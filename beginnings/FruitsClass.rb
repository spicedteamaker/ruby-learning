class FruitsClass

	# the initialize def is like a constructor, it can take arguments, or not.
	# we can't overload constructors like in other languages, but we can do
	# something else. We give it arguments, but set default values to nil.
	# Check if they're nil, and act accordingly.
=begin
	def initialize(best_fruit = nil)
		# The @ symbol represents this class' variable, like 'this' in java
		@worst_fruit = "mango"
		@best_fruit = best_fruit unless best_fruit.nil?
	end
=end

	# Note that there is another method of getting optional arguments in constructors
	# Below is encountered often. What we actually do is pass arguments
	# in Hash form, and handle them accordingly.

	def initialize(args = nil)
		@best_fruit = args["best_fruit"] unless args.nil?
		@worst_fruit = "mango"
		puts "wee"
	end

	# ruby has things called accessors. There are three:
	# attr_reader :worst_fruit - makes the variable readable
	# attr_writer :worst_fruit - makes the variable writable
	# attr_accessor :worst_fruit - makes the variable both readable & writable
	# let's make worst_fruit readable, so anyone who instantiates it can read it
	attr_reader :worst_fruit
	attr_reader :best_fruit

	def puts_apple()
		puts "It's an apple!"
	end
end
