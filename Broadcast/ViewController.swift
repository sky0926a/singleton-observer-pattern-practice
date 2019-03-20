//
//  ViewController.swift
//  Broadcast
//
//  Created by Jimmy Li on 2019/3/20.
//  Copyright © 2019 Jimmy Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var pushButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        pushButton.addTarget(self, action: #selector(push), for: .touchUpInside)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Singleton.shared.register(observer: self)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Singleton.shared.unregister(observer: self)
    }
}

extension ViewController: SingletonObserver {
    func write(with result: String) {
        print("data:\(result)")
    }
}


extension ViewController {
    @objc func tap() {
        Singleton.shared.send(write: "5555")
    }
    
    @objc func push() {
        let viewcontroller: NextViewController = NextViewController()
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
}
