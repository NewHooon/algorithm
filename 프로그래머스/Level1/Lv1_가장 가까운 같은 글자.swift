import Foundation

func solution(_ s:String) -> [Int] {
    var dictionary:[Character:Int] = [:]
    var answer:[Int] = []
    for (index, value) in s.enumerated(){
        if let wordIndex = dictionary[value]{
            answer.append(index - wordIndex)
        }else{
            answer.append(-1)
        }
        dictionary[value] = index
    }
    return answer
}
