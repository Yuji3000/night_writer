require_relative 'braille'

class EnglishTranslator
  include Braille

  def to_one_string(file)
    string = ''
    file.each_char do |character|
      string.concat character.to_s
    end
    string
  end

  def convert_to_arrays(input)
    to_one_string = to_one_string(input)
    input_array = []
    continuous_string = to_one_string.downcase
    continuous_string.each_char do |braille_character|
      input_array << BRAILLE_ALPHABET[braille_character]
    end
    input_array
  end

  def translate_to_braille(input_string)
    letters = convert_to_arrays(input_string).reject(&:nil?)
    row_1 = []
    row_2 = []
    row_3 = []
    letters.each do |letter|
      row_1 << letter[0]
      row_2 << letter[1]
      row_3 << letter[2]
    end
    row_chunk1 = row_1.each_slice(40).to_a
    row_chunk2 = row_2.each_slice(40).to_a
    row_chunk3 = row_3.each_slice(40).to_a
    return_braille = ''
    i = 0
    loop do
      return_braille << row_chunk1[i].join
      return_braille << "\n"
      return_braille << row_chunk2[i].join
      return_braille << "\n"
      return_braille << row_chunk3[i].join
      return_braille << "\n"
      break if i == (row_chunk1.length - 1)

      i += 1
    end
    return_braille
  end
end
