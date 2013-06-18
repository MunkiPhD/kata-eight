class ConcatenatedReadable
	def initialize(dictionary)
		@dictionary = dictionary
	end

	def six_letter_words
		@dictionary.select { |word| word.length == 6 }
	end
end
