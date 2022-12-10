import Foundation

func solution(_ topping:[Int]) -> Int {
    
    var answer = 0, totalCnt = 0
    var totalSet = Set<Int>(), baseSet = Set<Int>()
    var checkArray:[Int] = Array(repeating: 0, count: 10001)

    for number in topping{
        if !totalSet.contains(number){totalSet.insert(number)}
        checkArray[number] += 1
    }
    
    totalCnt = totalSet.count

    for number in topping{
        if !baseSet.contains(number){ baseSet.insert(number) }
        checkArray[number] -= 1
        if checkArray[number] == 0{ totalCnt -= 1 }
        if baseSet.count == totalCnt { answer += 1}
    }
    return answer
}
