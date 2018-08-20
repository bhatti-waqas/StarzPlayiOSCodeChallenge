//
//  TVShowDataStore.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 19/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//

import Foundation
import NetworkLayer_bhatti
//import AlamofireNetwork

protocol TVShowDataStore {
    
    func getTVShowDetails(with tvId:String, request: TVShowAPIRequestModel, onCompletion : @escaping ResultHandler<TVShowAPIResponseModel>)
    func getTVSeasonDetails(with tvId:String, seasonNumber:String, request: TVShowAPIRequestModel, onCompletion : @escaping ResultHandler<TVSeasonDetailsResponseModel>)
}
