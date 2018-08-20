//
//  TVEpisodeTableViewCellViewModel.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 19/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//

import Foundation

protocol TVEpisodeTableViewCellViewModeling {
    
    var name :String { get }
    var posterPath : String? { get }
    
    
}

struct TVEpisodeTableViewCellViewModel:TVEpisodeTableViewCellViewModeling{
    
    fileprivate let tvEpisode:TVEpisodeResponseModel!
    init(tvEpisode: TVEpisodeResponseModel) {
        self.tvEpisode = tvEpisode
    }
    var name: String { return tvEpisode.name}
    var posterPath: String? { return tvEpisode.fullposterPath()}
}
