import Foundation

let n = Int(readLine()!)!

var dp = Array(repeating: 0, count: n)
let card = readLine()!.split(separator:" ").map{Int($0)!}
dp[0] = card[0]

if n <= 0 {
    print(dp[n-1])
}else{
    for i in 1..<n{
        dp[i] = card[i]
        var left = 0, right = i - 1
        while left <= right{
            dp[i] = max(dp[i], dp[left] + dp[right])
            left += 1
            right -= 1
        }
    }
    print(dp[n-1])
}


