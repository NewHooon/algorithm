import Foundation

func solution(_ operations:[String]) -> [Int] {
    var heapQueue: [Int] = []
    for operation in operations {
        let operationTuple =  operation.components(separatedBy: " ")
        let number = operationTuple[1]
        switch operationTuple[0]{
            case "I":
                heapQueue.append(Int(number)!)
            case "D":
                if heapQueue.isEmpty { break }
                if number == "-1" {
                    heapQueue.sort{ $0 > $1 }
                    heapQueue.removeLast()
                }else{
                    heapQueue.sort{ $0 < $1}
                    heapQueue.removeLast()
                }
            default:
                break
        }
    }
    heapQueue.sort{ $0 > $1 }
    return heapQueue.isEmpty ? [0,0] : [heapQueue[0], heapQueue[heapQueue.count - 1]]
}
