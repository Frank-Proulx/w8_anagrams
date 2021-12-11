require 'dictionary_lookup'

class Anagrams
  attr_reader(:use_dictionary)

  def initialize(input1, input2)
    @input1 = input1
    @input2 = input2
    @word1 = @input1.downcase.split('').delete_if{|x| x.match(/[^a-z]/)}
    @word2 = @input2.downcase.split('').delete_if{|x| x.match(/[^a-z]/)}
    @bad_words = []
    @use_dictionary = true
  end

  def checker
    if !(self.is_word?) && @use_dictionary
      @use_dictionary = false
      "Sorry, no dictionary match found for: #{@bad_words.join(', ')}. If you believe this is in error, and would like to see your results anyway, enter 'y' in the terminal now."
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
      "These entries aren't anagrams but #{match_array.length} letter#{s_maybe} match#{es_maybe}: #{match_array.join(", ")}."
    end
  end

  def is_word?
    result = true
    word_array1 = @input1.split(' ')
    word_array2 = @input2.split(' ')
    word_array1.map! do |word|
      word_cheat1 = word.split('')
      word.downcase.split('').delete_if{|x| (x.match(/[^a-z]/)) && (word_cheat1.find_index(x) == (word.length - 1))}.join('')
    end
    word_array2.map! do |word|
      word_cheat2 = word.split('')
      word.downcase.split('').delete_if{|x| (x.match(/[^a-z]/)) && (word_cheat2.find_index(x) == (word.length - 1))}.join('')
    end
    word_array1.each do |word|
      results = DictionaryLookup::Base.define(word)
      if !(results.count >= 1)
        @bad_words.push(word)
        result = false
      end
    end
    word_array2.each do |word|
      results = DictionaryLookup::Base.define(word)
      if !(results.count >= 1)
        @bad_words.push(word)
        result = false
      end
    end
    result
  end

end