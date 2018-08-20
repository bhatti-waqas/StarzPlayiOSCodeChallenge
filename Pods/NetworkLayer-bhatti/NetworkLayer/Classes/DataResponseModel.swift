//
//  DataRequestModel.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 18/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//

import Foundation

public enum ResultType<T> {
    case success(T)
    case failure(NetworkError)
}

public struct DataResponseModel<T> {
    
    public let result:ResultType<T>
}
