#!/usr/bin/env ruby

$symbolScores = {"X" => 1, "Y" => 2, "Z" => 3}

def getScore(symbols)
    symbolScore = $symbolScores[symbols[1]]
    resultScore = 0
    case symbols
    in ["A", "X"]
        resultScore = 3
    in ["B", "Y"]
        resultScore = 3
    in ["C", "Z"]
        resultScore = 3
    in ["A", "Y"]
        resultScore = 6
    in ["B", "Z"]
        resultScore = 6
    in ["C", "X"]
        resultScore = 6
    in ["A", "Z"]
        resultScore = 0
    in ["B", "X"]
        resultScore = 0
    in ["C", "Y"]
        resultScore = 0
    end
    return symbolScore + resultScore
end

symbolList = File
    .read("input.txt")
    .split("\n")
    .map { |line| line.split(" ") }

score = symbolList
    .reduce(0) { |score, symbols| score + getScore(symbols) }

print score
