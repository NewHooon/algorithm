import Foundation

extension String{
    var todayNumber: Int {
        let day = self.components(separatedBy:".").map{Int($0)!}
        return day[0]*12*28 + day[1]*28 + day[2]
    }
}

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    var answer:[Int] = []
    var termDictionary:[String: Int] = [:]
    
    for term in terms{
        let termArr = term.components(separatedBy:" ")
        termDictionary[termArr[0]] = Int(termArr[1])! * 28
    }

    for (index, privacy) in privacies.enumerated() {
        let pArr = privacy.components(separatedBy:" ")
        let term = pArr[1]
        let day = pArr[0].todayNumber
        if today.todayNumber >= day + termDictionary[term]!{
            answer.append(index + 1)
        }
    }
    return answer
}
