//
//  Detectable.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 19/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//

import Foundation

class Detectable<T> {
    
    typealias Subscriber = ((T) -> Void)
    
    private var subscriber : Subscriber?
    
    var value : T {
        didSet{
            subscriber?(value)
        }
    }
    
    init(_ value : T) {
        self.value = value
    }
    
    func bind(subscriber : @escaping Subscriber) {
        self.subscriber = subscriber
    }
}
