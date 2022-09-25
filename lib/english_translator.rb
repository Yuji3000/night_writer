require_relative 'braille'

class EnglishTranslator
  include Braille

  def to_braille(incoming_text)
    braille_array = []
    incoming_text.each_char do |char| 
      braille_array << @braille_alphabet[char]
    end
    braille_array
  end

  def writer(incoming_text)
    brailler = to_braille(incoming_text)
    row_1 = []
    row_2 = []
    row_3 = []
    brailler.each do |letters| 
        row_1 << letters[0].to_s
        row_2 << letters[1]
        row_3 << letters[2]
      end
      # letter_row = []
      # #will take count of rows / 80. round up for row length
      # row_lengths = row_1.count.to_f / 80.ceil 
      # row_lengths.times do |index|
      # #do block
      #   letter_row << row_1 using index find first 80 characters
      #   letter_row << "\n"
      # end
      #   #row_3
      #   #row_3
      

      # #index keeps track of which iteration im on
      


      return_braille = "#{row_1.join}\n#{row_2.join}\n#{row_3.join}"
    # if row_1.length > 79 && row_2.length > 79 && row_3.length > 79
      return_braille
  end
end


