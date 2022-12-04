#!/usr/bin/env ruby

# print "a".ord # 97
# print "A".ord # 65

sum = File
    .readlines("input.txt")
    .each_slice(3)
    .map { |chunk| chunk.map {|str| str.chars.uniq}.reduce { |a, b| a & b } }
    .map(&:first)
    .map { |char| char.ord >= 97 ? char.ord - 96 : char.ord - 64 + 26 }
    .sum

print sum
