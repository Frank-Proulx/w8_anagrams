class Anagrams

  def checker(word1, word2)
    if word1.split('').sort() == word2.split('').sort()
      "These words are anagrams."
    end
  end
end