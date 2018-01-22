module Ex25

def Ex25.break_words(stuff)
	words = stuff.split(' ')
	return words
end

def Ex25.sort_words(stuff)
	return stuff.sort
end

def Ex25.print_first_word(stuff)
	word = stuff.shift
	puts word
end

def Ex25.print_last_word(stuff)
	word = stuff.pop
	puts word
end

def Ex25.sort_sentence(stuff)
	words = Ex25.break_words(stuff)
	return Ex25.sort_words(words)
end

def Ex25.print_first_and_last(stuff)
	words = Ex25.break_words(stuff)
	Ex25.print_first_word(words)
	Ex25.print_last_word(words)
end

end
