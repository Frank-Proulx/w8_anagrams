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
    else
      match_array = @word1 & @word2
      s_maybe = ""
      es_maybe = "es"
      if match_array.length > 1
        s_maybe = "s"
        es_maybe = ""
      end
      "These entries aren't anagrams but #{match_array.length} letter#{s_maybe} match#{es_maybe}: #{match_array.join(", ")}"
    end
  end
end