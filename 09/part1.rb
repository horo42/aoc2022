#!/usr/bin/env ruby

require "matrix"

head = tail = Vector[0, 0]
visitedCoords = []
dirToCoordMap = {
    "U" => Vector[0, -1],
    "L" => Vector[-1, 0],
    "D" => Vector[0, 1],
    "R" => Vector[1, 0],
}

ops = File
    .readlines("input.txt", chomp: true)
    .map(&:split)
    .map { |(dir, step)| [dirToCoordMap[dir], step.to_i] }
    .each { |dir, step|
        (1..step).each {
            head += dir
            magnitude = (head - tail).magnitude
            if magnitude == 2 then
                tail += (head - tail) / 2
            elsif magnitude > 2 then
                diff = (head - tail).map { |x| x.abs > 1 ? x / 2 : x }
                tail += diff
            end
            visitedCoords.push(tail)
        }
    }

p visitedCoords.uniq.size
