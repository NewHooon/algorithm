//
//  main.swift
//  25501
//
//  Created by sehooon on 2022/11/28.
//

import Foundation

let input = Int(readLine()!)!
var isPalindrome : [(Int, Int)] = []

for _ in 1...input{
    let string = readLine()!.map{String($0)}
    var l = 0, r = string.count - 1, answer = 0, depth = 0
    while(true){
        if l >= r {
            depth += 1
            answer = 1
            break
        } else if string[l] != string [r] {
            depth += 1
            answer = 0
            break
        } else {
            depth += 1
            l += 1
            r -= 1
            
        }
    }
    isPalindrome.append((answer, depth))
}
 
isPalindrome.forEach { print($0.0, $0.1) }





/*
 #include <stdio.h>
 #include <string.h>

 int recursion(const char *s, int l, int r){
     if(l >= r) return 1;
     else if(s[l] != s[r]) return 0;
     else return recursion(s, l+1, r-1);
 }

 int isPalindrome(const char *s){
     return recursion(s, 0, strlen(s)-1);
 }

 int main(){
     printf("ABBA: %d\n", isPalindrome("ABBA")); // 1
     printf("ABC: %d\n", isPalindrome("ABC"));   // 0
 }
 */
