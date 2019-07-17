//
//  ReverseInteger.swift
//  leetcode
//
//  Created by hang lee on 2019/7/17.
//  Copyright © 2019 lazyaudio. All rights reserved.
//

import UIKit

class ReverseInteger: NSObject {
    func reverse(_ x: Int) -> Int {
        var res = 0
        var x = x
        while (x != 0) {
            if (res > Int(Int32.max) / 10 || res < Int(Int32.min) / 10) {
                return 0;
            }
            res = res * 10 + x % 10
            x = x / 10
        }
        return res
    }
}
