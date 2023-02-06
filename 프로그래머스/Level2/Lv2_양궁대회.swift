import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var maxScore = 0
    var minCombArr:[Int] = Array(repeating:0,count:11)
    var combArr:[Int] = Array(repeating:0,count:11)
    
    func combination(_ depth:Int, _ choice: Int){
        if depth == n{
            var apeachScore = 0
            var ryanScore = 0
            for score in 0...10{
                if info[score] < combArr[score]{ ryanScore += 10 - score }
                else if info[score] >= combArr[score] && info[score] != 0{ apeachScore += 10 - score }
            }
            if ryanScore > apeachScore {
                if maxScore < ryanScore - apeachScore {
                    maxScore = ryanScore - apeachScore
                    minCombArr = combArr
                } else if maxScore == ryanScore - apeachScore {
                    for score in 0...10{
                        if minCombArr[10-score] < combArr[10-score]{
                            minCombArr = combArr
                            break
                        }else if minCombArr[10-score] > combArr[10-score]{
                            break
                        }
                    }
                }
            }
        }else{
            for score in choice...10{
                combArr[score] += 1
                combination(depth+1, score)
                combArr[score] -= 1
            }
        }
    }
    combination(0,0)
    return minCombArr == combArr ? [-1] : minCombArr
}

