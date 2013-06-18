require_relative 'concatenated_readable.rb'

describe ConcatenatedReadable do
	let(:dictionary) { ['al', 'bums', 'bar', 'ely', 'be', 'foul', 'con', 'vex', 'albums', 'barely', 'befoul', 'convex', 'somethinglong', 'ash', 'tigers', 'pandas'] }
	let(:readable) { ConcatenatedReadable.new(dictionary) }
=begin
		al + bums => albums
		bar + ely => barely
		be + foul => befoul
		con + vex => convex
		here + by => hereby
		jig + saw => jigsaw
		tail + or => tailor
		we + aver => weaver
=end

	it 'finds all six letter words' do
		six_letter_words = readable.words_of_length(6)
		%w(albums barely befoul convex tigers pandas).each do |word|
			expect(six_letter_words.include?(word)).to be_true
		end
	end

	it 'returns nothing when length is less than 4' do
		expect(readable.find_concatenated_words_equaling_length(3)).to eq []
	end

	it 'finds six letter words that are concatenated' do
		words = readable.find_concatenated_words_equaling_length(6)
		expect(words.length).to eq 4
		%w(albums barely befoul convex).each do |word|
			expect(words.include?(word)).to be_true
		end
	end
end
