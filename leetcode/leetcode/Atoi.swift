//
//  Atoi.swift
//  leetcode
//
//  Created by hang lee on 2019/7/18.
//  Copyright © 2019 lazyaudio. All rights reserved.
//

/*
 将字符串转为整型
 
 example:
 
 let atio = Atoi()
 print(atio.myAtoi("     -234fff"))
 
 output:
 【-234】
 */

import UIKit

class Atoi: NSObject {
    func myAtoi(_ str: String) -> Int {
        let int_max = 2147483647
        let int_min = -2147483648
        // 正负号
        var flag: Int  = 1
        // 最终返回的结果（result）
        var res: Int = 0
        // 遍历字符串的index
        var index: Int = 0
        // 将字符串转为字符数组
        var content = Array(str)
        
        // 1.去除字符串首部的空格
        while index < content.count {
            guard (content[index] == " ") else {
                break
            }
            index += 1
        }
        
        // 2.正数，负数判断
        if (content[index] == "-") {
            flag = -1
            index += 1
        } else if (content[index] == "+") {
            index += 1
        }
        
        // 3.将字符串数组转为整型
        while index < content.count {
            guard (_isDigtal(content[index])) else {
                break
            }
            
            // 超过范围直接返回最大值，最小值
            if (res >= int_max && flag == 1) {
                return int_max
            } else if (res >= int_max && flag == -1) {
                return int_min
            }

            res = res * 10 + Int(String(content[index]))!
            index += 1
        }
        res = res * flag
        return res
    }
}

extension Atoi {
    private func _isDigtal(_ character: Character) -> Bool {
        if (character >= "0" && character <= "9" ) {
            return true
        } else {
            return false
        }
    }
}
