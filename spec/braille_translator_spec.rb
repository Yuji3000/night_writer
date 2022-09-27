require 'rspec'
require './lib/braille_translator'
require 'spec_helper'

describe BrailleTranslator do
  it 'exists' do
    braille_translator = BrailleTranslator.new
    expect(braille_translator).to be_an_instance_of(BrailleTranslator)
  end

  it 'can turn one into three separate braille strings' do
    braille_translator = BrailleTranslator.new
    string = "0.0.0.0.0.\n00.00.0..0\n....0.0.0.\n" # hello
    braille_translator.separate_braille_in_3_lines(string)
    expect(braille_translator.top_row).to eq('0.0.0.0.0.')
    expect(braille_translator.middle_row).to eq('00.00.0..0')
    expect(braille_translator.bottom_row).to eq('....0.0.0.')
  end

  it 'can split braille lines by twos in an array' do
    braille_translator = BrailleTranslator.new
    string = '0.0.0.0.0.' 
    expect(braille_translator.slice_braille_in_twos(string)).to eq(['0.', '0.', '0.', '0.', '0.'])
  end

  it 'can split 3 braille lines by two' do
    english_printer = BrailleTranslator.new
    top = '0.0.0.0.0.' 
    middle = '00.00.0..0'
    bottom = '....0.0.0.'
    english_printer.slice_all_lines(top, middle, bottom)
    expect(english_printer.top_row).to eq(['0.', '0.', '0.', '0.', '0.'])
    expect(english_printer.middle_row).to eq(['00', '.0', '0.', '0.', '.0'])
    expect(english_printer.bottom_row).to eq(['..', '..', '0.', '0.', '0.'])
  end

  it 'can translate braille' do
    english_printer = BrailleTranslator.new
    string = "0.0.0.0.0.\n00.00.0..0\n....0.0.0.\n"
    expect(english_printer.translate(string)).to eq('hello')
  end
end
