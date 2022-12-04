#!/usr/bin/env ruby

count = File
    .readlines("input.txt")
    .map { |str|
        parts = str.split(",")
        parts.map { |part| part.split("-").map(&:to_i) }
    }
    .map { |(a, b)|
        (b[0].between?(*a) and b[1].between?(*a)) or
        (a[0].between?(*b) and a[1].between?(*b))
    }
    .count(true)

print count
