require('rspec')
require('anagrams')

describe('Anagrams#checker') do
  it('will take two words as arguements and check if they are anagrams, returning a phrase if they are') do
    words = Anagrams.new()
    expect(words.checker("listen", "silent")).to(eq("These words are anagrams."))
  end
end