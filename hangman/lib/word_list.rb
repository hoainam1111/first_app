# lib/word_list.rb
# chọn ngẫu nhiên 1 tưf có 5-12 chữ cái trong list
class WordList
  def initialize(file_path)
    
    @words = File.readlines(file_path).map(&:chomp).select { |word| word.length.between?(5, 12) }
  end

  def random_word
    @words.sample
  end
end
