//
//  TVEpisodeTableViewCell.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 19/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//

import UIKit

class TVEpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImgView: UIImageView!
    @IBOutlet weak var episodeNameLabel: UILabel!
    fileprivate var viewModel:TVEpisodeTableViewCellViewModeling!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(episode: TVEpisodeResponseModel)  {
        
        episodeNameLabel.text = episode.name
        posterImgView.loadImage(withUrlString: episode.fullposterPath(), placeholderImage: UIImage(named: "emptyImage"))
    }
    func configure(episodeViewModel: TVEpisodeTableViewCellViewModeling)  {
        
        episodeNameLabel.text = episodeViewModel.name
        posterImgView.loadImage(withUrlString: episodeViewModel.posterPath, placeholderImage: UIImage(named: "emptyImage"))
    }

}
