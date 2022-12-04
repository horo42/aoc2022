#!/usr/bin/env ruby

# print "a".ord # 97
# print "A".ord # 65

sum = File
    .read("input.txt")
    .split("\n")
    .each_slice(3).to_a
    .map { |chunk| chunk
        .map {|str| str.chars.to_a.uniq}
        .reduce { |a, b| a & b }
    }
    .map(&:first)
    .map { |char| char.ord >= 97 ? char.ord - 96 : char.ord - 64 + 26 }
    .sum

print sum
