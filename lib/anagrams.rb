class Anagrams
  def initialize(word1, word2)
    @word1 = word1.downcase
    @word2 = word2.downcase
  end

  def checker
    vowel_array = ['a', 'e', 'i', 'o', 'u', 'y']
    if (!@word1.split('').any? { |letter| vowel_array.include?(letter) }) || (!@word2.split('').any? { |letter| vowel_array.include?(letter) })
      "Sorry, but you must enter actual words."
    elsif !@word1.split('').any? { |letter| @word2.split('').include?(letter) }
      "These words don't share any letters and as such are antigrams."
    elsif @word1.split('').sort == @word2.split('').sort
      "Congradulations, these are anagrams!"
    end
  end
end