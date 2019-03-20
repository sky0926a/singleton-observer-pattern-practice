//
//  LeftView.swift
//  Broadcast
//
//  Created by Jimmy Li on 2019/3/20.
//  Copyright © 2019 Jimmy Li. All rights reserved.
//

import UIKit

class LeftView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Singleton.shared.register(observer: self)
        backgroundColor = .blue
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Singleton.shared.register(observer: self)
        backgroundColor = .blue
    }
    
}

extension LeftView: SingletonObserver {
    func write(with result: String) {
        print("LeftView:\(result)")
    }
}
