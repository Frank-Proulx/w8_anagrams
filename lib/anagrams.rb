class Anagrams
  def initialize(word1, word2)
    @word1 = word1
    @word2 = word2
  end

  def checker
    if @word1.split('').sort() == @word2.split('').sort()
      "These words are anagrams."
    end
  end
end