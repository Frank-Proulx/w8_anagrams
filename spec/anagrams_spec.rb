require('rspec')
require('anagrams')

describe('Anagrams#checker') do
  it('will take two words as arguements and check if they are anagrams, returning a phrase if they are') do
    words = Anagrams.new("listen", "silent")
    expect(words.checker).to(eq("Congradulations, these are anagrams!"))
  end

  it('will account for case in determining whether words are anagrams') do
    words = Anagrams.new("Listen", "Silent")
    expect(words.checker).to(eq("Congradulations, these are anagrams!"))
  end

  it('will use the is_word method to determine if all words in the string entered are words, and if not inform the user with a message that includes the words that are not actual words') do
    words = Anagrams.new("lkjfd is the fjkl", "silent")
    expect(words.checker).to(eq("Sorry, no dictionary match found for: lkjfd, fjkl. If you believe this is in error, and would like to see your results anyway, enter 'y' in the terminal now."))
  end

  it('will check if the words share no letters at all and return a phrase if so') do
    words = Anagrams.new("tree", "fang")
    expect(words.checker).to(eq("These words don't share any letters - they are antigrams!"))
  end

  it('will function for strings of words as well as single words and remove spaces and punctuation to do so') do
    words = Anagrams.new("A gentleman", "Elegant man!")
    expect(words.checker).to(eq("Congradulations, these are anagrams!"))
  end

  it('will return a phrase which indicates how many and which letters match for entries that are words but are neither anagrams nor antigrams') do
    words = Anagrams.new("I am same", "I am different")
    expect(words.checker).to(eq("These entries aren't anagrams but 4 letters match: i, a, m, e."))
  end
end

describe('Anagrams#is_word?') do
  it('will use the dictionary_lookup gem to check if the inputted word is actually a word') do
    words = Anagrams.new("lkjasf", "silent night")
    expect(words.is_word?).to(eq(false))
  end
end