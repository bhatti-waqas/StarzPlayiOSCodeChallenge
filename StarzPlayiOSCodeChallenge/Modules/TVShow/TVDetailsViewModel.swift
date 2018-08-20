//
//  TVDetailsViewModel.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 19/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//

import Foundation

protocol TVShowDetailsViewModeling {
    
    func getTVShowDetails(withTVId tvId:String)
    func getTVSeasonDetails(withTVId tvId:String, seasonNumber:String)
    func totalEpisodesOfSeason() -> Int
    func episodeCellViewModel(at row:Int) -> TVEpisodeTableViewCellViewModeling
    
}

class TVDetailsViewModel: TVShowDetailsViewModeling {
    
    var tvShowDataSource :TVShowAPIResponseModel?
    var fetchedData = Detectable<TVShowAPIResponseModel?>(nil)
    var dataLoaded = Detectable<Bool>(false)
    var isLoadingSeasonDetails = Detectable<Bool>(true)
    var seasonDetailsLoaded = Detectable<Bool>(false)
    var tvSeason: TVSeasonAPIModel?
    var tvSeasonDetails: TVSeasonDetailsResponseModel?
    var error = Detectable<String?>(nil)
    private var dataStore : TVShowDataStore = TVShowAPIDataStore()
    var selectedSeasonNumber: Int = -1
    //MARK:- Initializer
    public init( dataStore : TVShowDataStore = TVShowAPIDataStore()) {
        
        self.dataStore = dataStore
    }
    
    func getTVShowDetails(withTVId tvId: String) {
        
        let request =  TVShowAPIRequestModel()
        dataStore.getTVShowDetails(with: tvId, request: request) { [weak self] (result)in
            
            guard let strongSelf = self else{
                return
            }
            
            switch result {
                case .success(let data):
                    strongSelf.updateTVShowDataSource(tvId:tvId ,data: data)
                
            case .failure(let error):
                strongSelf.error.value = error.description
            }
        }
        
    }
    func getTVSeasonDetails(withTVId tvId: String, seasonNumber: String) {
        isLoadingSeasonDetails.value = true
        self.tvSeasonDetails = nil
        let request = TVShowAPIRequestModel()
        dataStore.getTVSeasonDetails(with: tvId, seasonNumber: seasonNumber, request: request) { [weak self] (result) in
            
            guard let strongSelf = self else{
                return
            }
            
            switch result {
            case .success(let data):
                strongSelf.updateTVSeasonDetailsDataSource(data: data)
                
            case .failure(let error):
                strongSelf.error.value = error.description
                strongSelf.isLoadingSeasonDetails.value = false
            }
        }
    }
    func updateTVShowDataSource(tvId: String, data: TVShowAPIResponseModel) {
        
        self.tvShowDataSource = data
        self.dataLoaded.value = true
        guard let tvSeason = tvShowDataSource?.seasons.first else{
            self.dataLoaded.value = true
            return
        }
        let tvSeasonNumber = "\(tvSeason.seasonNumber)"
        self.selectedSeasonNumber = tvSeason.seasonNumber
        self.getTVSeasonDetails(withTVId: tvId, seasonNumber: tvSeasonNumber)
        
    }
    func updateTVSeasonDetailsDataSource(data: TVSeasonDetailsResponseModel){
        self.tvSeasonDetails = data
        selectedSeasonNumber = data.seasonNumber
        self.dataLoaded.value = true
        self.seasonDetailsLoaded.value = true
        self.isLoadingSeasonDetails.value = false
    }
    func totalEpisodesOfSeason() -> Int {
        //by default season 1
        guard let tvSeasonDetails = self.tvSeasonDetails else{
            return 0
        }
        return tvSeasonDetails.episodes.count
    }
    func episodeCellViewModel(at row: Int) -> TVEpisodeTableViewCellViewModeling {
        
        return TVEpisodeTableViewCellViewModel(tvEpisode: tvSeasonDetails!.episodes[row])
    }
    

}

