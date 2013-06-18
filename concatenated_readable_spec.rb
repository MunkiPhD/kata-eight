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
		expect(readable.six_letter_words.count).to eq 6
	end
end
