func solution(_ dartResult:String) -> Int {
    var answer = 0, index = 0
    let dartResultArr = dartResult.map{String($0)}
    var scoreArr:[Int] = []
    while index < dartResultArr.count{
        let bonus = dartResultArr[index]
        if ["S","D","T"].contains(bonus){
            var option = index+1 < dartResultArr.count ? dartResultArr[index+1] : ""
            var score = Int(dartResultArr[index-1])!
            var bonusNumber = 1
            if score == 0 && index-2 >= 0 && dartResultArr[index-2] == "1"{ score = 10 }
            if bonus == "D"{ score = score * score }
            else if bonus == "T" { score = score * score * score}
            if option == "*"{
                if !scoreArr.isEmpty{ scoreArr.append(scoreArr.popLast()! * 2) }
                 scoreArr.append(score*2)
            }else if option == "#"{
                scoreArr.append(score * -1)
            }else {
                scoreArr.append(score)
            }
        }
        index += 1
    }
    for score in scoreArr {  answer += score  }
    return answer
}
