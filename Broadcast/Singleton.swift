//
//  Singleton.swift
//  Broadcast
//
//  Created by Jimmy Li on 2019/3/20.
//  Copyright © 2019 Jimmy Li. All rights reserved.
//

import Foundation

public protocol SingletonObserver: class {
    func write(with result: String)
}

extension SingletonObserver {
    func write(with result: String) {}
}

struct WeakSingletonObserver {
    weak var weakReference: SingletonObserver?
}

class Singleton {
    static let shared = Singleton()
    lazy var observers: [WeakSingletonObserver] = []
    
    private init() {
        
    }
    
    func register(observer: SingletonObserver) {
        observers = observers.filter { $0.weakReference != nil && $0.weakReference !== observer }
        observers.append(WeakSingletonObserver(weakReference: observer))
    }
    func unregister(observer: SingletonObserver) {
        observers = observers.filter { $0.weakReference != nil && $0.weakReference !== observer }
    }
    
    func send(write result: String) {
        for observer in observers {
            observer.weakReference?.write(with: result)
        }
    }
    
}
