
puts ""
puts "ree"

=begin
# A comment, this is so you can read your program later
# Anything after the # is ignored by ruby.

puts "I could have code like this." # And the comment after is ignored

# You can also use a comment to "disable" or comment out a piece of code:
# puts "This won't run"

puts "This will run"
=end

# ex 3 interpolation
=begin
puts "I will now count my chickens:"
puts "Hens #{25 + 30 / 6}"
puts "Roosters #{100 - 25 * 3 % 4}"
puts "Now I will count the eggs:"

puts 3 + 2 + 1 - 5 + 4 % 2 - 1 / 4 + 6
puts "Is it true that 3 + 2 < 5 - 7?"
puts 3 + 2 < 5 - 7

puts "what is 3 + 2? #{3+2}"
puts "What is 5 - 7? #{5-7}"

puts "Oh, that's why it's false."
puts "How about some more."
puts "is it greater? #{5 > -2}"
puts "Is it greater or equal? #{5 >= 2}"
puts "is it less or equal? #{5 <= -2}"

# a / b with c remaining. a % b = c
puts 100 / 16 # 6
puts 16 * 6 # 96
puts 100 % 16 # 4
=end

# ex 4 variables, arithmetic
=begin
cars = 100
space_in_a_car = 4.0
drivers = 30
passengers = 90
cars_not_driven = cars - drivers
cars_driven = drivers
carpool_capacity = cars_driven * space_in_a_car
average_passengers_per_car = passengers / cars_driven

puts "there are #{cars} cars available"
puts "there are only #{drivers} drivers available"
puts "there will be #{cars_not_driven} empty cars today"
puts "we can transport #{carpool_capacity} people today"
puts "we have #{passengers} to carpool today"
puts "we need to put about #{average_passengers_per_car} in each car"
=end

#ex 5 variables
=begin
name = "doop beep"
age = 69
height = 73
weight = 140
eyes = "green"
teeth = "white"
hair = "white"

puts "Let's talk about #{name}"
puts "He is #{height} inches tall"
puts "he's #{weight} pounds heavy"
puts "Actually that's not too heavy"
puts "he's got #{eyes} eyes and #{hair} hair"
puts "His teeth are usually #{teeth} depending on the coffee"

#this line is tricky!!
puts "if I add #{age}, #{height}, and #{weight} I get #{age + height + weight}."
=end

# ex 6 variables
=begin
types_of_people = 10
x = "there are #{types_of_people} types of people"
binary = "binary"
do_not = "don't"
y = "those who know #{binary} and those who #{do_not}."

puts x
puts y

puts "I said: #{x}"
puts "I also said: #{y}"

hilarious = false
joke_evaluation = "isn't that joke so funny?! #{hilarious}"

puts joke_evaluation
w = "this is the left side of ..."
e = "a string with a right side"
puts w + e
=end

# ex 7 strings
=begin
puts "mary had a little lamb"
puts "its fleece was white as #{'snow'}"
puts "and everywhere that mary went"
puts "." * 10

=end

# ex 8
=begin
formatter = "%{first} %{second} %{third} %{fourth}"
puts formatter % {first: 1, second: 2, third: 3, fourth: 4}
puts formatter % {first: "one", second: "two", third: "three", fourth:"four"}
puts formatter % {first: true, second: false, third: true, fourth: false}
puts formatter % {first: formatter, second: formatter, third: formatter, fourth: formatter}

puts formatter % {
  first: "I had this thing",
  second: "that you could type up right",
  third: "But it didn't sing",
  fourth: "so I said goodnight",
}
=end

# ex 9 %q => single quoted strings
=begin
days = "Mon Tue Wed Thu Fri Sat Sun"
months = "Jan\nFeb\nMar\nApr\nJun\nJul\nAug"

puts "Here are the days: #{days}"
puts "Here are the months: #{months}"

puts %q{
  there's something going on Here
  with this weird quote
  we'll be able to type as much as we like
  even 4 lines if we want, or 5, or 6
}
=end

# ex 10 escape char
=begin
tabby_cat = "\tI'm tabbed in."
persian_cat = "I'm split\non a line."
backslash_cat = "i'm \\ a \\ cat"
fat_cat = """
i'll do a list:
\t* cat food
\t* fishies
\t* Catnip\n\t* Grass
"""

puts tabby_cat
puts persian_cat
puts backslash_cat
puts fat_cat
=end

# ex 11 string input
=begin
print "How old are you? "
age = gets.chomp
print "How tall are you? "
height = gets.chomp
print "How much do you weigh? "
weight = gets.chomp
puts "So, you're #{age} old, #{height} tall, and #{weight} heavy."
=end

# ex 12 integer input, float
=begin
print "Give me a number!: "
number = gets.to_i

bigger = number * 100
puts "A bigger number is #{bigger}"

print "Give me another number: "
another = gets.to_f
smaller = another / 100.0
puts "A smaller number is #{smaller}"
=end

# ex 12.1 input arithmetic
=begin
puts "Let's play with some money"
print "Enter some amount: "
money_in = gets.to_f
money_out = money_in * 0.10
puts "Well, you now get back #{money_out}"
=end
# ex 13
=begin
first, second, third = ARGV
puts "Your first variable is: #{first}"
puts "Your second variable is: #{second}"
puts "Your third variable is: #{third}"
=end

# ex 14 input with stdin
=begin
# There's a difference between $stdin.gets and gets.
# normal gets will use Kernel#gets, which first tries to read from ARGV
# If there is no ARGV, then it will use stdin gets.
# If you have ARGV input, then you need to use stdin.gets instead
user_name = ARGV.first #gets the first arg
prompt = '> '

puts "Hi #{user_name}"
puts "I'd like to ask you a few questions"
puts "Do you like me, #{user_name}?"
puts prompt
likes = $stdin.gets.chomp

puts "Where do you live, #{user_name}?"
puts prompt
lives = $stdin.gets.chomp('')

# a comma for puts is like using it twice
puts "What kind of computer do you have? ", prompt
computer = $stdin.gets.chomp('')
puts """
Alright, so you said #{likes} about liking me,
but you live in #{lives}. Not sure where that is.
And you have a #{computer}, computer. Nice!
"""
=end

# ex 15 reading files
=begin
filename = ARGV.first
# this creates a file object, which you can then read later
txt = open(filename)

puts "Here's your file #{filename}:"
print txt.read
#important to close files when finished
txt.close

print "Type the file name again: "
# you need .chomp here, or else it'll interpret a \n
file_again = $stdin.gets.chomp
txt_again = open(file_again)
print txt_again.read
txt_again.close
=end

# ex 16 file writing
=begin
prompt = "> "
filename = ARGV.first
puts "We're going to erase #{filename}"
puts "If you don't want that, hit ctrl-c (^c)"
puts "If you want that, hit RETURN"
#empty prompt
print prompt
$stdin.gets
puts "Opening the file..."
# open the file and make it writable
target = open(filename, 'w')

puts "Truncating the file (deleting the contents)"
#truncate's arguments mean that the file should be at most
# int x bytes long. In this case zero (empty)
target.truncate(0)
puts "Time to ask for three lines"

print "line 1: "
line1 = $stdin.gets.chomp
print "line 2: "
line2 = $stdin.gets.chomp
print "line 3: "
line3 = $stdin.gets.chomp

puts "and now to write these to the file"
contents = "#{line1} \n#{line2} \n#{line3} \n"
target.write(contents)
puts "Closing file..."
target.close
=end
=begin
# ex 17 more files
from_file, to_file = ARGV
puts "Copying contents from #{from_file} to #{to_file}"
in_read = open(from_file).read
puts "Does the output file exist? #{File.exists?(to_file)}"
out_file = open(to_file, "w")
out_file.write(in_read)
puts "All done"
out_file.close
=end

# ex 18 names, variables, code, functions
=begin
# *args means there can be an indefinite amount of arguments
# You can even create def print_two(arg1, arg2, *args)
# which also says there must be 2 arguments, and then whatever else comes after
# can be inspected in a list form
def print_two(*args)
	arg1, arg2 = args
	puts "arg1: #{arg1}, arg2: #{arg2}"
end

def print_two_again(arg1, arg2,*args)
	puts "arg1: #{arg1}, arg2: #{arg2}"
	puts "Anything else?: #{args}"
end

def print_one(arg1)
	puts "arg1: #{arg1}"
end

def print_none()
	puts "I got nothin'"
end

print_two("beep", "boop")
print_two_again("beep", "boop", "nyaaa", "blah")
print_one("beep")
#parenthesis can actually be omitted when there are no arguments
print_none
=end

# ex 19 more variables and functions
=begin
def cheese_and_crackers(cheese_count, boxes_of_crackers)
	puts "You have #{cheese_count} cheeses"
	puts "you have #{boxes_of_crackers} boxes of crackers"
	puts "That's enough for a party!"
end

puts "some direct arguments"
cheese_and_crackers(10,20)

puts "or some variables!"
cheese = 10
crackers = 50
cheese_and_crackers(cheese, crackers)
=end

# ex 20 functions and files
=begin
input_file = ARGV.first
def print_all(f)
	puts f.read
end

def rewind(f)
	f.seek(0)
end

def print_a_line(line_count, f)
	puts "#{line_count}. #{f.gets.chomp}"
end

current_file = open(input_file)
puts "print the whole file: \n"
print_all(current_file)
puts "And rewind"
#This makes ruby jump to a location in the file
rewind(current_file)
puts "And three lines"
print_a_line(1, current_file)
print_a_line(2, current_file)
print_a_line(3, current_file)
=end

# ex 21 function returns
# Ruby happens to implicitly return whatever the last expression calculaets
# Using return is explicit
=begin
def add(a, b)
	a + b
end

age = add(10, 12)
puts "Age: #{age}"
=end

# ex 24 practice
=begin
puts "Let's practice stuff!"
puts "You\'d need to know \'bout escapes with \\ that do \n newlines and \t tabes"

# Heredocs are multiline strings, they begin with << and a keyword (anything you want)
# and end with the keyword. In this case, we use stuffedTea, in all caps
some_stuff = <<STUFFEDTEA
beep boop
i'm a robot
I don't like humans
beep boop
STUFFEDTEA

puts "----------"
puts some_stuff
puts "----------"


five = 10 - 2 + 3 - 6
puts "This should output five: #{five}"

def sooper_sekrit(ingredient_count)
	spiciness = ingredient_count * 100
	level = spiciness / 2
	deliciousness = spiciness + level
	return spiciness, level, deliciousness
end

amount = 50
puts sooper_sekrit(amount)
puts "Who cares about the amount: #{sooper_sekrit(75)}"
# returning multiple objects actually returns an array
puts "What about the second item?: #{sooper_sekrit(75)[1]}"

# we can also use C style variables in strings
puts "the spiciness is %d, the level is %d, and finally we have a deliciousness of %d" % sooper_sekrit(amount)
=end

# ex29 ifs and conditionals

=begin
people = 20
cats = 30
dogs = 15

if people < cats
	puts "Too many cats, the world is doomed!"
end

if people > cats
	puts "Not many cats, the world is saved!"
end

if people < dogs
	puts "The world is dead! So many dogs!"
end

if people > dogs
	"puts the world is dry! people are greater!"
end

dogs += 5
if people >= dogs
	puts "people are greater than or equal to dogs"
end

if people <= dogs
	puts "people are <= dogs"
end

if people == dogs
	puts "people == dogs"
end

=end


# ex30 else and if

=begin
people = 30
cars = 50
trucks = 20

if cars > people
	puts "there are more cars than people, make more people!"
elsif people < cars
	puts "there are more people than cars. Think about making more cars!"
elsif people == cars
	puts "we've reached equilibrium!"
else
	puts "something is wrong!"
end

if trucks > people
	puts "this is weird! why are there more trucks than people?"
else
	puts "all is well in the world. More people, less trucks"
end

if cars > people || trucks > people
	puts "there are more cars or trucks than people. Build more people!!!!"
end
=end

# ex31 decisions
=begin
puts "You enter a dark room. A door is on your left, covered in webs. A door on your right has grass peaking out of the cracks."
puts "Which door will you enter?"
print "> "
choice = $stdin.gets.chomp

if choice == "left"
	puts "You walk in the left door and you're covered in spiders!"
elsif choice == "right"
	puts "You walk in the right door and you witness a sunrise!"
else
	puts "You've entered something incorrect. Unfortunately the game ends when that happens"
end
=end

# ex32 loops and arrays
=begin
the_count = [1,2,3,4,5]
fruits = ["apples","oranges","pears","apricots"]
change = [1, "pennies", 2, "dimes", 3, "quarters"]

# for-each loop, do NOT write it this way.
for number in the_count
	puts "counting...#{number}"
end


# this is another for-each loop
# this is the preferred ways to write them in ruby
fruits.each do |fruit|
	puts "listing fruits: #{fruit}"
end

# Another way to write it ruby-style
change.each {|i| puts "listing out change: #{i}"}

# let's fix our original the_count to conform to ruby
puts "Better ruby-style"
the_count.each do |i|
	puts "counting...#{i}"
end

# building array, starting empty
elements = []

# add to the array
# The (0..5) is a range operator
(0..5).each do |i|
	puts "Adding #{i} to the list"
	# push to the end of the list
	elements.push(i)
end

elements.each{|i| puts "element is: #{i}"}

# and a two-dimensional array!
two_d = [[1,2,3,4,5], [4,3,2,1,0]]
puts "going through our 2D array"
two_d.each {|i| puts "counting: #{i}"}

# now go through them individually
two_d.each do |i|
	i.each do |y|
		puts "counting: #{y}"
	end
end

# or another format
two_d.each {|i| i.each {|y| puts "second way: #{y}"}}

=end

# ex33 white loops
=begin
i = 0
numbers = []

while i < 12
	numbers.push(i)
	puts "numbers: #{numbers}"
	# the increment i++ does NOT exist in ruby. everything in ruby is an object
	i+=1
end
i = 0
numbers = []

# remember, we can just do it like so as well:
(0..11).each {|i| numbers.push(i)}
puts numbers
puts "#{numbers}"
=end

# ex34 accessing elements in arrays
=begin
animals = ["bear", "owl", "hawk", "cheetah", "dog", "cat"]
puts "#{animals}"
owl = animals[1]
puts owl
animals[1] = "chicken"
puts "#{animals}"
=end

# ex35 branches and functions
=begin
def room
	puts "In this room lies a desk and a vase. Which do you inspect?"
	print "> "
	choice = $stdin.gets

	#
	if choice.include?("desk") && choice.include?("vase")
		die("unable to understand!")
	elsif choice.include?("desk")
		puts "You find a magic book"
	elsif choice.include?("vase")
		puts "You don't see anything interesting"
	else
		die("unable to understand")
	end
end

def die(reason)
	puts reason
	exit(1)
end

room

=end

# ex37 symbol review
=begin
puts "BEGIN - Run this block when the script starts. - BEGIN {puts 'hi'}"
puts "END - Run this block when the script is done. - END {puts 'bye'}"
puts "alias - Create another name for a function. - alias X Y"
puts "and - logical and, but lower priority than && - puts 'Hello' and 'goodbye'"
puts "begin - Start a block, usually for exceptions. - begin end"
puts "break - Break out of a loop right now. - while true; break; end"
puts "case - Case style conditional, like an if - case X; when Y; else; end"
puts "class - Define a new class. - class X; end"
puts "def - Define a new function - def X(); end"
puts "defined? - is this class/function/etc. defined already? - defined? Class == 'constant'"
puts "do - Create a block that maybe takes a parameter - (0..5.each do |x| puts x end)"
puts "end - Ends blocks, functions, classes, everything - begin end"
puts "ensure - Run this code whether an exception happens or not - begin ensure end"
puts "module - Define a new module - module X; end"
puts "next - Skip to the next element of a .each iterator - (0..5).each {|y| next}"
puts "redo - Rerun a code block exactly the same - (0..5).each {|i| redo if i > 2}"
puts "rescue - Run this code if an exception happens - begin rescue X; end"
puts "retry - In a rescue clause, says to try the block again. - (0..5).each {|i| retry if i > 2}"
puts "return - Returns a value from a function. - return X"
puts "self - The current object, class, or module. - defined? self == 'self'"
puts "super - The parent class of this class - super"
puts "then - Can be used with if optionally - if true then puts 'hi' end"
puts "undef - Remove a function defined from a class - undef X"
puts "until - Inverse of while, execute a block as long as false - until false; end"
puts "when - Part of case conditionals - case X; when Y; else; end"
puts "yield - Pause and transfer control to the code block - yield"

puts "nil - Represents nothing 'null' - x = nil"
puts "hashes - Stores a key=value mapping of things. - e = {'x' => 1, 'y' => 2}"

puts ". - Dot access - '1'.to_i == 1"
puts ":: - Colon access - Module::Class"
puts "! - not - !true == false"
puts "== - Equal - 4 == 4 == true"
puts "=== - Equality - 4 === 4 == true"
puts ".. - range inclusive - (0..3).to_a == [0,1,2,3]"
puts "... - range non-inclusive - (0...3).to_a == [0,1,2]"
puts "@ - Object scope - @var ; @@classvar"
puts "@@ - Class scope - @var ; @@classvar"
puts "$ - Global scope - $stdin"

=end

# ex38 more with arrays

ten_things = "Apples Oranges Crows Telephone Light Sugar"

puts "Wait, there are not 10 things in there. Fixing..."
stuff = ten_things.split(' ')
more_stuff = ["day", "night", "song", "frisbee", "corn", "banana", "girl", "boy"]

while stuff.length != 10
	next_one = more_stuff.pop
	puts "Adding: #{next_one}"
	stuff.push(next_one)
	puts "there are #{stuff.length} items"
end

puts "Now we have it!: #{stuff}"
puts stuff[1]
puts stuff[-1] #what?
puts stuff.pop()
puts stuff.join(' ')
puts stuff[3..5].join("#")
