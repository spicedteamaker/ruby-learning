
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

end1 = "C"
end2 = "h"
end3 = "e"
end4 = "e"
end5 = "s"
end6 = "e"
end7 = "B"
end8 = "u"
end9 = "r"
end10 = "g"
end11 = "e"
end12 = "r"

puts end1 + end2 + end3 + end4 + end5 + end6
puts end7 + end8 + end9 + end10 + end11 + end12
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
