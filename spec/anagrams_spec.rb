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
end