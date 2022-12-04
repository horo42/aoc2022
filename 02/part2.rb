#!/usr/bin/env ruby

def getScore(score, symbols)
    resultScore = {"X" => 0, "Y" => 3, "Z" => 6}[symbols[2]]
    case symbols
    in "A X"
        symbolScore = 3
    in "A Y"
        symbolScore = 1
    in "A Z"
        symbolScore = 2
    in "B X"
        symbolScore = 1
    in "B Y"
        symbolScore = 2
    in "B Z"
        symbolScore = 3
    in "C X"
        symbolScore = 2
    in "C Y"
        symbolScore = 3
    in "C Z"
        symbolScore = 1
    end
    return score + symbolScore + resultScore
end

score = File.readlines("input.txt", chomp: true).reduce(0) { |a, b| getScore(a, b) }
print score
