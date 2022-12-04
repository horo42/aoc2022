#!/usr/bin/env ruby

array = File
    .read("input.txt")
    .split("\n\n")
    .map { |line| line.split("\n").map(&:to_i).sum }
    .max(3)
    .sum

print array
