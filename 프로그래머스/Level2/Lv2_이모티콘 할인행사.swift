import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {

    var maxMoney = 0
    var maxUserNumber = 0
    let sales = [10,20,30,40]
    func dfs(_ depth:Int, _ saleArr:[Int]){
        if depth == emoticons.count {
          var totalNumber = 0
          var totalMoney = 0
          for user in users{
              var totalUserMoney = 0
              for (index, saleIndex) in saleArr.enumerated(){
                  let salePercent = sales[saleIndex]
                  let emoticonPrice = emoticons[index]
                  if user[0] <= salePercent { totalUserMoney += Int((100 - salePercent) * emoticonPrice / 100) }
              }
              if totalUserMoney < user[1]{
                 totalMoney += totalUserMoney
              } else{
                 totalNumber += 1
              }
          }
            if maxUserNumber < totalNumber {
                maxUserNumber = totalNumber
                maxMoney = totalMoney
            }
            if maxUserNumber == totalNumber && maxMoney < totalMoney{
                maxMoney = totalMoney
            }
        } else{
          for number in 0...3{
              dfs(depth+1, saleArr+[number])
          }
        }
    }

    dfs(0,[])

    return [maxUserNumber, maxMoney]
}
