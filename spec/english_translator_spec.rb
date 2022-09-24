require 'rspec'
require './lib/english_translator'

describe EnglishTranslator do
  it 'exists' do
    braille_printer = EnglishTranslator.new
    expect(braille_printer).to be_an_instance_of(EnglishTranslator)
    # expect(braille_printer.single_letter).to eq("")
  end
  it 'can turn input file text to individual letter strings' do
    braille_printer = EnglishTranslator.new
    incoming_file = File.open('./tester.txt', "r")
    expect(braille_printer.single_letter(incoming_file)).to eq("y""i")
  end
  xit 'can change english to braille alphabet hash key' do
    braille_printer = EnglishTranslator.new
    incoming_text = File.open('./tester.txt', "r")
    expect(braille_printer.writer("a")).to eq(["0.", "..", ".."])
  end
  # it 'can take word and turn it into individual one letter strings' do

  # end
end

# @single_letter = "#{row_1.join}/n#{row_2.join}/n#{row_3.join}/n"