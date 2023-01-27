import Foundation

let n = Int(readLine()!)!
var arr:[Int] = []
var answer = 0
for _ in 1...n{
    let input = Int(readLine()!)!
    arr.append(input)
}

var reversedArr = Array(arr.reversed())
for index in 0..<reversedArr.count-1  {
    if reversedArr[index] > reversedArr[index+1]{
        continue
    }else{
           answer +=  reversedArr[index+1] - reversedArr[index] + 1
           reversedArr[index+1] = reversedArr[index] - 1
    }
    
}

print(answer)
