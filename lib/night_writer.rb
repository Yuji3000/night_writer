# frozen_string_literal: true

require './lib/english_translator'

english_translator = EnglishTranslator.new
handle = File.open(ARGV[0], 'r')
incoming_text = handle.read

char_nums = incoming_text.length
braille_writer = File.open(ARGV[1], 'w')

puts "CREATED #{ARGV[1]} CONTAINING #{char_nums} CHARACTERS"
braille_writer.write(english_translator.translate_to_braille(incoming_text))
