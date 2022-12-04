#!/usr/bin/env ruby

def getScore(symbols)
    case symbols
    in ["A", "X"]
        resultScore = 0
        symbolScore = 3
    in ["A", "Y"]
        resultScore = 3
        symbolScore = 1
    in ["A", "Z"]
        resultScore = 6
        symbolScore = 2
    in ["B", "X"]
        resultScore = 0
        symbolScore = 1
    in ["B", "Y"]
        resultScore = 3
        symbolScore = 2
    in ["B", "Z"]
        resultScore = 6
        symbolScore = 3
    in ["C", "X"]
        resultScore = 0
        symbolScore = 2
    in ["C", "Y"]
        resultScore = 3
        symbolScore = 3
    in ["C", "Z"]
        resultScore = 6
        symbolScore = 1
    end
    return symbolScore + resultScore
end

symbolList = File.readlines("input.txt").map { |line| line.split(" ") }
score = symbolList.reduce(0) { |score, symbols| score + getScore(symbols) }
print score
