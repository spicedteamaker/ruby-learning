# Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

sequence = [1,2]
# populate fibbonaci
while sequence[-1] < 4000000
	sequence.push(sequence[-1] + sequence[-2])
end
# bad fix
if sequence[-1] >= 4000000
	sequence.delete_at(sequence.length - 1)
end
puts "#{sequence}"
sum = 0
# now sum of all evens
sequence.each do |num|
	if (num % 2 == 0)
		sum += num
	end
end
puts sum
