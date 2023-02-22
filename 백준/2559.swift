import Foundation

let input = readLine()!.split(separator:" ").map{Int($0)!}
let n = input[0], k = input[1]
var tempArr = readLine()!.split(separator:" ").map{Int($0)!}

var answer = 0, baseSum = 0
var startIdx = 0, endIdx = k-1

for idx in 0..<k{ baseSum += tempArr[idx] }
answer = baseSum

while endIdx < tempArr.count - 1{
    baseSum += tempArr[endIdx + 1] - tempArr[startIdx]
    answer = max(baseSum,answer)
    endIdx += 1
    startIdx += 1
}

print(answer)


