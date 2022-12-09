#!/usr/bin/env ruby

require "matrix"

knots = [].fill(0, 10) { Vector[0, 0] }
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
            knots[0] += dir
            (0..9).each_cons(2) { |idxA, idxB|
                knotA = knots[idxA]
                knotB = knots[idxB]

                magnitude = (knotA - knotB).magnitude
                if magnitude == 2 then
                    knots[idxB] += (knotA - knotB) / 2
                elsif magnitude > 2 then
                    diff = (knotA - knotB).map { |x| (x > 1 or x < 1) ? x / 2 : x }
                    knots[idxB] += diff
                end
            }

            visitedCoords.push(knots.last)
        }
    }

p visitedCoords.uniq.size
