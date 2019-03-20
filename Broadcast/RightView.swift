//
//  RightView.swift
//  Broadcast
//
//  Created by Jimmy Li on 2019/3/20.
//  Copyright © 2019 Jimmy Li. All rights reserved.
//

import UIKit

class RightView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Singleton.shared.register(observer: self)
        backgroundColor = .red
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Singleton.shared.register(observer: self)
        backgroundColor = .red
    }
    
}

extension RightView: SingletonObserver {
    func write(with result: String) {
        print("RightView:\(result)")
    }
}
