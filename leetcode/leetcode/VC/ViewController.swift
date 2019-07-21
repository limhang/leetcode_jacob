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
        let commonTree = BasicTreeOp()
        let tree = commonTree.createTree([5,1,4,-1,-1,3,6])
        print(tree)
    }


}

