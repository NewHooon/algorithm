import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {

    var answer:[Int] = []
    var numberArr:[Int] = []

    for (day, value) in score.enumerated(){
        if day < k {
            numberArr.append(value)
        }else{
            if numberArr.last! < value{
                numberArr[numberArr.count - 1] = value
            }
        }
        numberArr.sort{ $0 > $1 }
        answer.append(numberArr.last!)

    }

    return answer
}
