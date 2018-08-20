//
//  Networking.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 18/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//
import Foundation
public typealias DataResponseHandler<T> = (DataResponseModel<T>) -> Void
public typealias ResultHandler<T> = (ResultType<T>) -> Void

public protocol Networking {
    func requestObject<T:Decodable>(_ request: RequestConverterProtocol,completionHandler: @escaping DataResponseHandler<T>)
}

