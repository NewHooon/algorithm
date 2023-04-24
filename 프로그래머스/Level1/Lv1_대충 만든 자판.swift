import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    
    var alphaDictionary:[String:Int] = [:]
    var answer:[Int] = []
    for key in keymap {
        for (idx, alpha) in key.map{String($0)}.enumerated() {
            if let value = alphaDictionary[alpha] {
                alphaDictionary[alpha] = value < idx+1 ? value : idx+1
            }else{
                alphaDictionary[alpha] = idx+1
            }
        }
    }
    
    for target in  targets {
        var sum = 0
        for alpha in target.map{String($0)} {
            if let value = alphaDictionary[alpha]{
                sum += value
            }else{
                sum = 0
                break
            }
        }
        if sum == 0 {
            answer.append(-1)
        }else{
            answer.append(sum)
        }
    }
    return answer
}
