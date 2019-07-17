//
//  AddTwoNumbers.swift
//  leetcode
//
//  Created by hang lee on 2019/7/16.
//  Copyright © 2019 lazyaudio. All rights reserved.
//

import UIKit

public class NodeList {
    var val: Int
    var next: NodeList?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class AddTwoNumbers: NSObject {

    func add(_ list1: NodeList?, _ list2: NodeList?) -> NodeList? {
        guard let list1 = list1 else {
            return list2
        }
        
        guard let list2 = list2 else {
            return list1
        }
        
        let outList = NodeList((list2.val + list1.val) % 10)
        if (list2.val + list1.val > 9) {
            outList.next = add(add(list1.next, list2.next), NodeList(1))
        } else {
            outList.next = add(list1.next, list2.next)
        }
        return outList
    }
}

extension AddTwoNumbers {
    func logNode(_ list:NodeList?) {
        var list = list
        var text = "["
        while (list != nil) {
            text += "\(list!.val)"
            list = list!.next
            if list != nil {text += ", "}
        }
        text += "]"
        print(text)
    }
}
