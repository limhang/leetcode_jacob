//
//  LongestValidParentheses.swift
//  leetcode
//
//  Created by hang lee on 2019/7/17.
//  Copyright © 2019 lazyaudio. All rights reserved.
//

/*
 最长回文子串，使用动态规划
 f(i,j) = {
    1.ture                          ,i=j
    2.S[i] = S[i]                   ,j=i+1
    3.S[i] = S[j] and f(i+1,j-1)    ,j>i+1
 }
 
 动态规划的解释
 *writes down "1+1+1+1+1+1+1+1 =" on a sheet of paper*
 "What's that equal to?"
 *counting* "Eight!"
 *writes down another "1+" on the left*
 "What about that?"
 *quickly* "Nine!"
 "How'd you know it was nine so fast?"
 "You just added one more"
 "So you didn't need to recount because you remembered there were eight! Dynamic Programming is just a fancy way to say 'remembering stuff to save time later'"
 */

import UIKit

class LongestValidParentheses: NSObject {
    func findLongestPalindrome_DP(str: [String]) -> String {
        var maxLen = 1
        var longestPalindromeString = ""
        var dp = [[Int]](repeating: [Int](repeating: 0, count: str.count), count: str.count)
        
        // 单个字符是回文串
        for i in 0 ..< str.count {
            dp[i][i] = 1
        }
        
        // 两个连续相同的字符也是回文串
        for i in 0 ..< str.count-1 {
            if str[i] == str [i+1] {
                dp[i][i+1] = 1
                maxLen = 2
                var tmp = [String]()
                tmp.append(str[i])
                tmp.append(str[i+1])
                longestPalindromeString = tmp.joined()
            }
        }
        
        // 找出三个字符的回文串并以此类推
        for k in 3 ... str.count {
            for i in 0 ... str.count - k {
                let j = i + k - 1
                if str[i] == str [j] {
                    dp[i][j] = dp[i+1][j-1]
                    if dp[i][j] == 1 && maxLen < k {
                        maxLen = k
                        var tmp = [String]()
                        for m in i ..< j+1 {
                            tmp.append(str[m])
                        }
                        longestPalindromeString = tmp.joined()
                    }
                }else {
                    dp[i][j] = 0
                }
            }
        }
        
        return longestPalindromeString
    }
}
