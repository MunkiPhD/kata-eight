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
		six_letter_words = readable.six_letter_words
		%w(albums barely befoul convex tigers pandas).each do |word|
			expect(six_letter_words.include?(word)).to be_true
		end
	end
end
