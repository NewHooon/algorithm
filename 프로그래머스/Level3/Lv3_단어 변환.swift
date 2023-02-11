
import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    var answer = Int.max
    if !words.contains(target) { return 0 }
    
    func dfs(_ begin: String, _ target: String, _ depth: Int, _ wordCheck:[String]){
        if begin == target {
            answer = answer > depth ? depth : answer
        }else{
            let beginArr = begin.map{String($0)}
            for word in words {
                if !wordCheck.contains(word){
                    let wordArr = word.map{String($0)}
                    var checkNumber = 0
                    for idx in 0..<wordArr.count{
                        if beginArr[idx] != wordArr[idx] {
                            checkNumber += 1
                        }
                    }
                    if checkNumber < 2 {
                        dfs(word, target, depth+1, wordCheck+[word])
                    }
                }
            }
        }
    }
    dfs(begin, target, 0, [])
    return answer
}
