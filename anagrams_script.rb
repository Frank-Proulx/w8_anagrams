#!/usr/bin/ruby

require('./lib/anagrams')

puts "To check for anagrams or antigrams, input your first word or phrase"
string1 = gets.chomp
puts "Please enter your second word or phrase"
string2 = gets.chomp
checking = Anagrams.new(string1, string2)
puts checking.checker