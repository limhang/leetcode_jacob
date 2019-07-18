//
//  ThreeSum.swift
//  leetcode
//
//  Created by hang lee on 2019/7/18.
//  Copyright © 2019 lazyaudio. All rights reserved.
//

import UIKit

/*
 输入一个数组，求解3数之和为0的所有情况
 
 双指针的方式，选定一个数组，左右指针，从头到尾遍历
 
 example:
 
 print(ThreeSum().sum([-1, 0, 1, 2, -1, -4]))

 output:
【[-1, -1, 2], [-1, 0, 1]】
 */

class ThreeSum: NSObject {
    func sum(_ array: [Int]) -> [[Int]] {
        var res = [[Int]]()
        // 1.将输入的数组转为排序数组
        var sortArray = array.sorted { (s1, s2) -> Bool in
            s1 < s2
        }
        
        // 2.双指针的方法，求解3数之和零的数组
        for i in 0...sortArray.count - 3 {
            var j = i + 1
            var k = sortArray.count - 1
            while j < k {
                if (sortArray[i] + sortArray[j] + sortArray[k] == 0) {
                    res.append([sortArray[i],sortArray[j],sortArray[k]])
                    break
                } else if (sortArray[i] + sortArray[j] + sortArray[k] > 0) {
                    k -= 1
                } else {
                    j += 1
                }
            }
        }
        return res
    }
}
