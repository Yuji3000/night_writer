require 'rspec'
require 'spec_helper'
require './lib/english_translator'

describe EnglishTranslator do
  it 'exists' do
    english_translator = EnglishTranslator.new
    expect(english_translator).to be_an_instance_of(EnglishTranslator)
  end

  it 'can turn a whole file into one string' do
    english_translator = EnglishTranslator.new
    file = File.open('./tester.txt', 'r')
    expect(english_translator.to_one_string(file)).to eq("hello\nworld")
  end

  it 'can translate text into braille arrays' do
    english_translator = EnglishTranslator.new
    expected = [['0.', '00', '..'],
                ['0.', '.0', '..'],
                ['0.', '0.', '0.'],
                ['0.', '0.', '0.'],
                ['0.', '.0', '0.'],
                ['..', '..', '..'],
                ['.0', '00', '.0'],
                ['0.', '.0', '0.'],
                ['0.', '00', '0.'],
                ['0.', '0.', '0.'],
                ['00', '.0', '..']]
    expect(english_translator.convert_to_arrays('hello world')).to eq(expected)
  end

  it 'can turn braille arrays into a single line' do
    english_translator = EnglishTranslator.new
    expected = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    expect(english_translator.organize_braille('hello world')).to eq(expected)
  end
end
