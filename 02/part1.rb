#!/usr/bin/env ruby

# print "A".ord # 65
# print "X".ord # 88

def getScore(score, symbols)
    opponentOrd = symbols[0].ord - 64
    playerOrd = symbols[2].ord - 87
    symbolScore = [1, 2, 3][playerOrd - 1]
    resultScore = [3, 0, 6][opponentOrd - playerOrd]
    return score + symbolScore + resultScore
end

score = File.readlines("input.txt", chomp: true).reduce(0) { |a, b| getScore(a, b) }
print score
