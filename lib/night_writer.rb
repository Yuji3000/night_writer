require './lib/english_translator'

    handle = File.open(ARGV[0], "r")
    incoming_text = handle.read

    char_nums = incoming_text.length
    braille_writer = File.open(ARGV[1], "w")

    puts "CREATED #{ARGV[1]} CONTAINING #{char_nums} CHARACTERS"
    braille_printer = EnglishTranslator.new
    braille_writer.write(braille_printer.writer(incoming_text))
