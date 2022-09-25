require 'rspec'
require './lib/english_translator'

describe EnglishTranslator do
  it 'exists' do
    braille_printer = EnglishTranslator.new
    expect(braille_printer).to be_an_instance_of(EnglishTranslator)
  end

  it 'can turn input file text to individual letter strings' do
    braille_printer = EnglishTranslator.new
    incoming_file = File.open('./tester.txt', "r")
    expect(braille_printer.to_braille(incoming_file)).to eq([["0.", "00", ".."],
      ["0.", ".0", ".."],
      ["0.", "0.", "0."],
      ["0.", "0.", "0."],
      ["0.", ".0", "0."],
      ["..", "..", ".."],
      [".0", "00", ".0"],
      ["0.", ".0", "0."],
      ["0.", "00", "0."],
      ["0.", "0.", "0."],
      ["00", ".0", ".."]])
  end

  it 'can change braille array to braille' do
    braille_printer = EnglishTranslator.new
    incoming_file = File.open('./tester.txt', "r")
    expect(braille_printer.writer(incoming_file)).to eq("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."
    )
  end

  # it 'can make a new line after 80 spaces' do
  #   braille_printer = EnglishTranslator.new

  # end
end

