//
//  ViewController.swift
//  leetcode
//
//  Created by hang lee on 2019/7/16.
//  Copyright © 2019 lazyaudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 字符串反转3
        let reverse3 = ReverseWordsInAString3()
        print(reverse3.reverseWords("reverse hello word") + "\n")
        
        // 2个数字相加
        let nodeList = AddTwoNumbers()
        let l1 = NodeList(1)
        l1.next = NodeList(2)
        l1.next!.next = NodeList(3)
        let l2 = NodeList(5)
        l2.next = NodeList(6)
        l2.next!.next = NodeList(7)
        nodeList.logNode(nodeList.add(l1,l2))
        
        // 最长回文子串
        let longestVaild = LongestValidParentheses()
        let string: String = "a b b a x c c d d e e d d c c"
        let stringArray = string.components(separatedBy: " ")
        print(longestVaild.findLongestPalindrome_DP(str: stringArray))
        
        
    }


}

