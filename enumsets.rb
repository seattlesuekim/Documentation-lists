require 'set'
require 'pp'
enum = open('enumerable.txt')
array = open('array.txt')
hash = open('hashes.txt')

enum_set = enum.readlines.map { |x| x.chomp}.to_set
array_set = array.readlines.map { |x| x.chomp}.to_set
hash_set = hash.readlines.map { |x| x.chomp}.to_set

diff_array = (enum_set - hash_set).to_a
puts "array - specific : #{diff_array.join('\n')}"

diff_hash = (enum_set - array_set).to_a
puts "hash-specific : #{diff_hash}"

intersection_array_hash = (array_set & hash_set).to_a
puts "intersection: #{intersection_array_hash}"

file = open('info.txt', 'w') { |file| file.write(diff_array.each) }

diff_enum = (enum_set - array_set - hash_set).to_a
