class ConcatenatedReadable
	def initialize(dictionary)
		@dictionary = dictionary
	end


	def words_of_length(length)
		@dictionary.select { |word| word.length == length }
	end


	def find_concatenated_words_equaling_length(length)
		# get the subset of words that are equal to this length
		subset = words_of_length(length)

		# we need to find words of length X made up of two smaller words
		# assumptions are that subwords must be at least two characters long, so we're basically looking for where the third and fourth character sit
		#  1234 56
		#  123 456
		#  12 3456

		# the number of sub words we'll have to try is the number of times we'll have to shift the characters where we still satisfy that a word must be at least 2 characters
		possibilities = length - 4
		if possibilities == 0
			return []
		end


		valid_words = []
		subset.each do |word|
			for i in 0..(possibilities - 1)
				word_one = word.slice(0, 2 + i)
				word_two = word.slice(word_one.length, word.length - 1)
				puts "#{word_one} .. #{word_two}"
				if @dictionary.include?(word_one) && @dictionary.include?(word_two)
					valid_words << word
					puts "match found with: #{word_one} .. #{word_two}"
				end
			end
		end

		valid_words
	end
end
