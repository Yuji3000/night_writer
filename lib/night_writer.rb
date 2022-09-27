# frozen_string_literal: true

require './lib/english_translator'

english_translator = EnglishTranslator.new
handle = File.open(ARGV[0], 'r')
incoming_text = handle.read

char_nums = incoming_text.each_char { |c| "#{c}" }.gsub("\n", "")
braille_writer = File.open(ARGV[1], 'w')

puts "CREATED #{ARGV[1]} CONTAINING #{char_nums.length} CHARACTERS"
braille_writer.write(english_translator.organize_braille(incoming_text))
