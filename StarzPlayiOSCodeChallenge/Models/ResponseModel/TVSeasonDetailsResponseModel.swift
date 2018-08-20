//
//  TVSeasonDetailsResponseModel.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 19/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//

import Foundation

class TVSeasonDetailsResponseModel : Decodable {
    
    var id : Int = -1
    var name : String = ""
    var posterPath : String?
    var airDate : String = ""
    var overview : String = ""
    var seasonNumber : Int = -1
    var episodes: [TVEpisodeResponseModel] = []
    enum CodingKeys : String, CodingKey {
        
        case id
        case name
        case posterPath = "poster_path"
        case airDate = "air_date"
        case overview
        case seasonNumber = "season_number"
        case episodes = "episodes"
    }
    
    func fullposterPath(size: ShowImageSize = .w92) -> String? {
        guard let posterImagePath = posterPath else {
            
            return nil
        }
        
        return APIURLs.imageBaseURL + size.rawValue + posterImagePath
    }
}
