require_relative 'braille'

class EnglishTranslator
  include Braille
  # attr_reader :single_letter
  # def initialize
  #   @single_letter = ""
  # end
  # def single_letter(incoming_text)
  #   require 'pry'; binding.pry
  #   single_string = ""
  #   incoming_text.each_char do |char| 
  #     single_string.concat "#{char}"
  #   end
  #   single_string
  # end

  def writer(incoming_text)
    braille_array = []
    braille = incoming_text.each_char do |char| 
      braille_array << @braille_alphabet[char]
    end
    braille_array.each do |letters|
      letters.each do |letter|
        puts letter
        # require 'pry'; binding.pry
        
      end
    end
  end



  # def writer(incoming_text)
  #   b_array = @braille_alphabet[incoming_text]
    
  #   row_1 = b_array[0]
  #   row_2 = b_array[1]
  #   row_3 = b_array[2]
  #   single_letter = "#{row_1}\n#{row_2}\n#{row_3}"
  #   return single_letter
   
    
  # end
end


