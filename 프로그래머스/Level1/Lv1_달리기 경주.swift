import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    
    var answer:[String] = players
    var playerNumber:[String:Int] = [:]
    for idx in players.indices{ playerNumber[players[idx]] = idx }
    
    for calling in callings{
        if let idx = playerNumber[calling]{
            let temp = answer[idx-1]
            playerNumber[calling]! -= 1
            playerNumber[temp]! += 1
            answer[idx-1] = answer[idx]
            answer[idx] = temp
        }
    }
    
    return answer
}
