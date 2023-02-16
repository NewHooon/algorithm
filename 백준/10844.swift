
import Foundation

let n = Int(readLine()!)!
var answer = 0
var dp:[[Int]] = Array(repeating:Array(repeating: 0, count: 10), count: n+1)

dp[1] = [0,1,1,1,1,1,1,1,1,1]

if n == 1 {
    print(dp[n].reduce(0, +))
}else{
    for i in 2...n{
        for j in 0...9{
            if j == 0 {
                dp[i][j] = dp[i-1][1] % 1000000000
            }else if j == 9{
                dp[i][j] = dp[i-1][j-1] % 1000000000
            }else {
                dp[i][j] = (dp[i-1][j+1] + dp[i-1][j-1]) % 1000000000
            }
        }
    }
    print(dp[n].reduce(0, +) % 1000000000 )
}



