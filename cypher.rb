class Ceasar
  @@UPPERCASE_LETTERS = ("A".."Z").to_a
  @@LOWERCASE_LETTERS = ("a".."z").to_a
  attr_accessor :key
  def initialize(key)
    @key = key
  end
  def ceasar_cipher(text)
    result = ""
      text.split("").to_a.each do |x| #Converts the text into an array an iterate over each index
        if @@UPPERCASE_LETTERS.include? x #We then check if the current variable is included in the UPPERCASE array
          result += @@UPPERCASE_LETTERS[ (@@UPPERCASE_LETTERS.index(x) + key) % 26] #We then find it's index and add the key to it
        elsif @@LOWERCASE_LETTERS.include? x
          result += @@LOWERCASE_LETTERS[ (@@LOWERCASE_LETTERS.index(x) + key) % 26]
        else
          result += x
        end
      end
      return result
  end
end
cc = Ceasar.new(5)
puts cc.ceasar_cipher("Show me your broken heart and all your scars")

