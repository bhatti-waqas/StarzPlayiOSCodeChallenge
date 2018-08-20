//
//  TVShowProtocol.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 19/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//

import Foundation

enum ShowImageSize:String {
    case w92 = "w92"
    case w185 = "w185"
    case w500 = "w500"
    case w780 = "w780"
}

protocol TVItemProtocol {
    
    var itemPosterPath:String? { get }
    var itemNumberOfSeasons:String {get}
}

//extension TVShowProtocol {
//
//    var itemRatingString : String? {
//
//        guard let rating = itemRating else { return "0" }
//        return String(format: "%0.2f", rating)
//    }
//
//    func fullPosterUrl(size : MediaImageSize = .w92) -> String? {
//
//        guard let posterPath = itemPosterPath else {
//
//            return nil
//        }
//
//        return APIURLs.imageBaseURL + size.rawValue + posterPath
//    }
//}

