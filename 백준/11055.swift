import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator:" ").map{Int($0)!}
var dp:[Int] = Array(repeating:0,count:n)

dp[0] = arr[0]
var answer = 0
for i in 0..<n{
    dp[i] = arr[i]
    for j in 0..<i{
        if arr[i] > arr[j]{
            dp[i] = dp[i] < dp[j] + arr[i] ? dp[j] + arr[i] : dp[i]
        }
    }
    answer = answer < dp[i] ? dp[i] : answer
}
print(answer)
