import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var answer = 0
    var visitCheck:[Int] = Array(repeating:0, count: 1001)
    var weightCheck:[Int] = Array(repeating:0, count:4001)
    
    for weight in weights{
        visitCheck[weight] += 1
        weightCheck[weight*2] += 1
        weightCheck[weight*3] += 1
        weightCheck[weight*4] += 1
    }
    
    for number in weightCheck{
        if number >= 2{ answer += (number-1) * number / 2 }
    }
    
    for number in visitCheck{
        if number > 1 { answer -= 2 * (number-1) * number / 2 }
    }
    
    return Int64(answer)
}
