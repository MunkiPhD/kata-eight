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
		expect(readable.six_letter_words.include?("albums")).to be_true
		expect(readable.six_letter_words.include?("barely")).to be_true
		expect(readable.six_letter_words.include?("befoul")).to be_true
		expect(readable.six_letter_words.include?("convex")).to be_true
		expect(readable.six_letter_words.include?("tigers")).to be_true
		expect(readable.six_letter_words.include?("pandas")).to be_true
	end
end
