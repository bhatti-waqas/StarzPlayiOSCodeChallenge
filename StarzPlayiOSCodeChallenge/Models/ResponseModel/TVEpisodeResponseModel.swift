//
//  TVEpisodeResponseModel.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 19/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//

import UIKit

class TVEpisodeResponseModel: Decodable {
    
    var id : Int = -1
    var name : String = ""
    var stillPath : String?
    var airDate : String = ""
    var overview : String = ""
    var seasonNumber : Int = -1
    var voteAverage: Double = 0.0
    var voteCount: Int = 9
    enum CodingKeys : String, CodingKey {
        
        case id
        case name
        case stillPath = "still_path"
        case airDate = "air_date"
        case overview
        case seasonNumber = "season_number"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    func fullposterPath(size: ShowImageSize = .w92) -> String? {
        guard let posterImagePath = stillPath else {
            
            return nil
        }
        
        return APIURLs.imageBaseURL + size.rawValue + posterImagePath
    }
}
