//
//  APIResponseModel.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 18/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//

import Foundation

class TVShowAPIResponseModel : Decodable {
    
    var id : Int = -1
    var name : String = ""
    var voteCount : Int = 0
    var voteAverage : Double = 0
    var posterPath : String?
    var firstAirDate : String = ""
    var popularity : Double = 0
    var originalLanguage : String = ""
    var backdropPath : String?
    var overview : String = ""
    var type:String = ""
    var originCountry : Array<String> = []
    var numberOfSeasons: Int = 0
    
    var seasons : [TVSeasonAPIModel] = []
    
    enum CodingKeys : String, CodingKey {
        
        case id
        case name
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case popularity
        case originalLanguage = "original_language"
        case backdropPath = "backdrop_path"
        case overview
        case originCountry = "origin_country"
        case numberOfSeasons = "number_of_seasons"
        case seasons = "seasons"
    }
    
    func fullBackDropPath(size: ShowImageSize = .w92) -> String? {
        guard let backDropImagePath = backdropPath else {
            
            return nil
        }
        
        return APIURLs.imageBaseURL + size.rawValue + backDropImagePath
    }
    func numberOfSeasonsText() -> String{
        return "\(numberOfSeasons) Seasons"
    }
}
