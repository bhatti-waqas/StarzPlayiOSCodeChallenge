//
//  TVSeasonAPIModel.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 19/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//

import Foundation

class TVSeasonAPIModel : Decodable {
    
    var id : Int = -1
    var name : String = ""
    var voteCount : Int = 0
    var voteAverage : Double = 0
    var posterPath : String?
    var firstAirDate : String = ""
    var popularity : Double = 0
    var originalLanguage : String = ""
    var overview : String = ""
    var originCountry : Array<String> = []
    var episodeCount: Int = 0
    var seasonNumber : Int = -1
    enum CodingKeys : String, CodingKey {
        
        case id
        case name
        case posterPath = "poster_path"
        case firstAirDate = "air_date"
        case overview
        case episodeCount = "episode_count"
        case seasonNumber = "season_number"
    }
    
    func fullposterPath(size: ShowImageSize = .w92) -> String? {
        guard let posterImagePath = posterPath else {
            
            return nil
        }
        
        return APIURLs.imageBaseURL + size.rawValue + posterImagePath
    }
}
