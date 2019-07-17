//
//  ReverseWordsInAString3.swift
//  leetcode
//
//  Created by hang lee on 2019/7/16.
//  Copyright © 2019 lazyaudio. All rights reserved.
//

import UIKit

/*
 example:
 
 let reverse3 = ReverseWordsInAString3()
 print(reverse3.reverseWords("reverse hello word") + "\n")
 
 output:
 【esrever olleh drow】
 */

class ReverseWordsInAString3: NSObject {
    func reverseWords(_ string: String) -> String {
        var index = 0 , stringArray = Array(string)
        for i in 0..<stringArray.count {
            if i + 1 == stringArray.count || (stringArray[i] != " " && stringArray[i+1] == " ") {
                reverse(&stringArray, index, i)
                index = i + 2
            }
        }
        return String(stringArray)
    }
    
    fileprivate func reverse<T>(_ array: inout [T], _ startIndex: Int, _ endIndex: Int) {
        var (left, right) = (startIndex, endIndex)
        while (left < right) {
            (array[left], array[right]) = (array[right], array[left])
            left += 1
            right -= 1
        }
    }
}
