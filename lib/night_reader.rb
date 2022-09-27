# frozen_string_literal: true

require './lib/braille_translator'

handle = File.open(ARGV[0], 'r')
incoming_text = handle.read

char_nums = incoming_text.length / 6
english_writer = File.open(ARGV[1], 'w')

puts "CREATED #{ARGV[1]} CONTAINING #{char_nums} CHARACTERS"
braille_translator = BrailleTranslator.new
english_writer.write(braille_translator.translate(incoming_text))
