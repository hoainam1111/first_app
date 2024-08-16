# main.rb
require_relative 'lib/word_list'
require_relative 'lib/hangman'

# Tạo đối tượng WordList với đường dẫn đến file words.txt
word_list = WordList.new('google-10000-english-no-swears.txt')
random_word = word_list.random_word

game = Hangman.new(random_word)

puts "Chào mừng đến với trò chơi Hangman!"
puts "Từ cần đoán có #{random_word.length} chữ cái."

until game.won? || game.lost?
  puts "\n#{game.display_word}"
  puts "Bạn có #{game.attempts_left} lần đoán còn lại."
  print "Đoán một chữ cái: "
  letter = gets.chomp.downcase
  game.guess_letter(letter)
end

if game.won?
  puts "\nChúc mừng! Bạn đã đoán đúng từ: #{game.word}"
else
  puts "\nBạn đã thua! Từ đúng là: #{game.word}"
end
