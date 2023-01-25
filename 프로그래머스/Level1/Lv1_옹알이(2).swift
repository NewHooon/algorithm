import Foundation

func solution(_ babbling:[String]) -> Int {
    var answer = 0
    var babbleArr = ["aya", "ye", "woo", "ma"]
    for babble in babbling {
        var nowWord = ""
        var tempWord = ""
        var checkNumber = 0
        for word in babble.map{String($0)} {
            nowWord += word
            if nowWord.count == 3 || nowWord.count == 2{
                if babbleArr.contains(nowWord) && tempWord != nowWord{
                    checkNumber += nowWord.count
                    tempWord = nowWord
                    nowWord = ""
                }
            }
        }
        if babble.count == checkNumber { answer += 1 }
    }
    return answer
}

