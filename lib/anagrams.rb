class Anagrams
  def initialize(word1, word2)
    @word1 = word1.downcase.split('').delete_if{|x| x.match(/[^a-z]/)}
    @word2 = word2.downcase.split('').delete_if{|x| x.match(/[^a-z]/)}
  end

  def checker
    vowel_array = ['a', 'e', 'i', 'o', 'u', 'y']
    if (!@word1.any? { |letter| vowel_array.include?(letter) }) || (!@word2.any? { |letter| vowel_array.include?(letter) })
      "Sorry, but you must enter actual words."
    elsif !@word1.any? { |letter| @word2.include?(letter) }
      "These words don't share any letters - they are antigrams!"
    elsif @word1.sort == @word2.sort
      "Congradulations, these are anagrams!"
    end
  end
end