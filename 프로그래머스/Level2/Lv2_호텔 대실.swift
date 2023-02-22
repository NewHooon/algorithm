import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var answer = 0
    var timeCheck = Array(repeating:0, count: 1450)
    
    for time in book_time{
        let startTime = time[0].split(separator: ":").map{Int($0)!}
        let endTime = time[1].split(separator: ":").map{Int($0)!}
        
        let startHour = startTime[0]  * 60
        let startMin = startTime[1]
        
        let endHour = endTime[0] *  60
        let endMin = endTime[1]
        timeCheck[startHour+startMin] += 1
        timeCheck[endHour+endMin+10] -= 1
    }
    
    for time in 1..<timeCheck.count{
        timeCheck[time] += timeCheck[time-1]
        answer = answer > timeCheck[time] ? answer : timeCheck[time]
    }
    return answer
}
