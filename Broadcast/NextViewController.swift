//
//  NextViewController.swift
//  Broadcast
//
//  Created by Jimmy Li on 2019/3/20.
//  Copyright © 2019 Jimmy Li. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Singleton.shared.register(observer: self)
        nextButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }

}

extension NextViewController: SingletonObserver {
    func write(with result: String) {
        print("NextViewController:\(result)")
    }
}

extension NextViewController {
    @objc func tap() {
        Singleton.shared.send(write: "5555")
    }
}
