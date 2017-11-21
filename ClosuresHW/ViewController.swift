//
//  ViewController.swift
//  ClosuresHW
//
//  Created by Vadim Shoshin on 21.11.2017.
//  Copyright © 2017 Vadim Shoshin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var changeColorAction: ((UIColor)-> Void)?
    private var printClosure: (() -> Void)?
    private var calculateCircumference = { r in
        return 2 * 3.14 * r
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printClosure = { print("I love Swift")}
        printClosure?()
        guard let nonOptClosure = printClosure else { return }
        repeatTask(times: 10, task: nonOptClosure)
        print(calculateCircumference(5))
        
        changeColorAction = { [unowned self] color in
            self.view.backgroundColor = color
        }
    }
    
    private func repeatTask(times: Int, task:() -> Void) {
        for _ in 1...10 {
            task()
        }
    }
    @IBAction func anyColorButtonClicked(_ sender: UIButton) {
        guard let colorToSet = sender.backgroundColor else { return }
        changeColorAction?(colorToSet)
    }
}

