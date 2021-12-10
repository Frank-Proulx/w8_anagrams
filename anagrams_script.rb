#!/usr/bin/ruby

require('./lib/anagrams')

puts "To check for anagrams or antigrams, input your first word or phrase"
string1 = ''
string2 = ''
while string1.length < 1
  puts "Please enter a word or phrase"
  string1 = gets.chomp
end
while string2.length < 1
  puts "Please enter a second word or phrase"
  string2 = gets.chomp
end
if (string1.split('').any?{|x| x.match(/\d/)}) || (string2.split('').any?{|x| x.match(/\d/)})
  puts "Your entry contains numbers, and words do not, so your typo has been graciously removed for you"
end
checking = Anagrams.new(string1, string2)
puts checking.checker