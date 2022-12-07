import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {

    var sum = 0
    var gArr:[Int] = []
    var countDictionary:[Int: Int] = [:]

    for value in tangerine{
        if let number = countDictionary[value] {
            countDictionary[value] = countDictionary[value]! + 1
        } else{
            countDictionary[value] = 1
            gArr.append(value)
        }
    }

    gArr.sort{ countDictionary[$0]! >  countDictionary[$1]! }

    for (index, number) in gArr.enumerated() {
        sum += countDictionary[number]!
        if sum >= k { return index + 1 }
    }

    return 0
}
