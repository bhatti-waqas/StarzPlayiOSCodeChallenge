//
//  TranslationLayer.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 18/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//

//import Foundation

public enum TranslationLayerError:Error {
    case encodingFailed
}

public protocol TranslationLayer {
    func encode<T:Encodable>(withModel model:T) throws -> [String:Any]
    func decode<T:Decodable>(withData data:Data) throws -> T
}

public class JSONTranslation:TranslationLayer {
    
    public init(){
        
    }
    public func encode<T>(withModel model: T) throws -> [String : Any] where T : Encodable {
        let encodedData = try JSONEncoder().encode(model)
        if let encoded = try JSONSerialization.jsonObject(with: encodedData, options:.allowFragments) as? [String : Any] {
            return encoded
        }
        throw TranslationLayerError.encodingFailed
    }
    
    public func decode<T>(withData data: Data) throws -> T where T : Decodable {
        return try JSONDecoder().decode(T.self, from: data)
    }
}
