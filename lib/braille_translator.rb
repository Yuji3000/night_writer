require_relative 'braille'

class BrailleTranslator
  include Braille
  attr_reader :top_row, :middle_row, :bottom_row

  def initialize
    @top_row = ''
    @middle_row = ''
    @bottom_row = ''
  end

  def separate_braille_in_3_lines(string)
    split_string = string.split
    split_string.each_slice(3).to_a.each do |slice|
      @top_row << slice[0]
      @middle_row << slice[1]
      @bottom_row << slice[2]
    end
  end

  def slice_braille_in_twos(string)
    string.chars.each_slice(2).to_a.map(&:join)
  end

  def slice_all_lines(top, middle, bottom)
    @top_row = slice_braille_in_twos(top)
    @middle_row = slice_braille_in_twos(middle)
    @bottom_row = slice_braille_in_twos(bottom)
  end

  def translate(string)
    separate_braille_in_3_lines(string)
    slice_all_lines(@top_row, @middle_row, @bottom_row)
    
    i = 0
    translation = ''
    loop do
      top_chunk = @top_row[i]
      middle_chunk = @middle_row[i]
      bottom_chunk = @bottom_row[i]
      translation_array = [top_chunk, middle_chunk, bottom_chunk]
      translation << BRAILLE_ALPHABET.key(translation_array)
      # require 'pry'; binding.pry
      break if i == @top_row.length - 1
      i += 1
    end
    translation
  end
end
