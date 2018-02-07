# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?
require "prime"
largest = 0
check = 600851475143
sequence = check / 2

if (Prime.prime?(check))
	puts "#{check} is a prime number. Thus, there are no other factors"
else
	sequence.downto(1).each do |num|
		if ( check % num == 0)
			possible = num
			puts "Found possible: #{possible}"
			if (Prime.prime?(possible))
				puts "Found largest!"
				largest = possible
				puts "Largest prime number of #{check} is #{largest}"
				break
			end
		end
	end
end
