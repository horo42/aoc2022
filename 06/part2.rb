#!/usr/bin/env ruby

index = File
    .read("input.txt")
    .split("")
    .each_cons(14)
    .to_a.find_index { |a| a.uniq.size == 14 } + 14

print index
