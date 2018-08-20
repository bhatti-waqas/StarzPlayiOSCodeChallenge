//
//  TVShowRequestModel.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 18/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//

import Foundation

struct TVShowAPIRequestModel:Codable {
    
    let apiKey:String = APPKeys.APIKeys.themoviedb
    
    private enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
    }
    
}
