import Foundation

let input = readLine()!.map{String($0)}
let searchWord = readLine()!

var answer = 0
var startIdx = 0
var endIdx = searchWord.count - 1

while endIdx < input.count{
    var compareString = ""
    for idx in startIdx...endIdx{ compareString += input[idx] }
    if compareString == searchWord {
        answer += 1
        startIdx = endIdx + 1
        endIdx += searchWord.count
    }else{
        startIdx += 1
        endIdx += 1
    }
}
print(answer)
