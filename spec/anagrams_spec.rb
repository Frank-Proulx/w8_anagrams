require('rspec')
require('anagrams')

describe('Anagrams#checker') do
  it('will take two words as arguements and check if they are anagrams, returning a phrase if they are') do
    words = Anagrams.new("listen", "silent")
    expect(words.checker).to(eq("These words are anagrams."))
  end

  it('will account for case in determining whether words are anagrams') do
    words = Anagrams.new("Listen", "Silent")
    expect(words.checker).to(eq("These words are anagrams."))
  end

  it('will first check for vowels to screen out non-words, returning a phrase if none are found') do
    words = Anagrams.new("lkjfd", "silent")
    expect(words.checker).to(eq("Sorry, but you must enter actual words."))
  end

  it('will check if the words share no letters at all and return a phrase if so') do
    words = Anagrams.new("tree", "fang")
    expect(words.checker).to(eq("These words don't share any letters and as such are antigrams."))
  end

end