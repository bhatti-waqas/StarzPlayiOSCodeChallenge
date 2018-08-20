//
//  TVShowAPIDataStore.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 19/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//

import NetworkLayer_bhatti
struct TVShowAPIDataStore: TVShowDataStore {

    let network:Networking = AlamofireNetwork.shared
    let translation:TranslationLayer = JSONTranslation()
    
    func getTVShowDetails(with tvId: String, request: TVShowAPIRequestModel, onCompletion: @escaping (ResultType<TVShowAPIResponseModel>) -> Void) {
        guard let parameter = try? translation.encode(withModel: request) else { onCompletion(.failure(.RequestFailed)); return  }
        
        let router = RequestRouter.TVShow.get(urlParams: tvId, parameters: parameter)
        network.requestObject(router) { (response:DataResponseModel<TVShowAPIResponseModel>) in
            onCompletion(response.result)
        }
        
    }
    
    
    func getTVSeasonDetails(with tvId: String, seasonNumber: String, request: TVShowAPIRequestModel, onCompletion: @escaping (ResultType<TVSeasonDetailsResponseModel>) -> Void) {

        guard let parameter = try? translation.encode(withModel: request) else { onCompletion(.failure(.RequestFailed)); return  }
        let router = RequestRouter.TVShow(tvId).getSeasons(nestedUrlParams: seasonNumber, params: parameter)
        
        network.requestObject(router) { (response:DataResponseModel<TVSeasonDetailsResponseModel>) in
            onCompletion(response.result)
        }

    }
}


