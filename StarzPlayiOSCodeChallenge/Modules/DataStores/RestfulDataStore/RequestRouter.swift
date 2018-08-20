//
//  RequestRouter.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 18/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//

import NetworkLayer_bhatti
struct RequestRouter{
    struct TVShow:Readable {
        var route = "tv"
        var urlParams: String!
        
    }
    struct TVSeason:Readable {
        var route = "season"
        var urlParams: String!
    }
}
extension RequestRouter.TVShow {
    func getSeasons(nestedUrlParams: String,params: [String : Any]) -> RequestConverterProtocol {
        return nestedRoute(args: nestedUrlParams, child: RequestRouter.TVSeason.get(urlParams: nestedUrlParams, parameters: params))
    }
}

