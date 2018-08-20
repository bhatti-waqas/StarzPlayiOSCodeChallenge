//
//  EpisodesListViewController.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 18/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//

import UIKit
import AVKit
class TVShowDetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var showNameLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var ratedLabel: UILabel!
    @IBOutlet weak var numberOfSeasonsLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var backDropImageView: UIImageView!
    var tvId:String = "62875"
    
    private let viewModel = TVDetailsViewModel()
    
    //MARK:- View LifeCyle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.bindViewModel()
        viewModel.getTVShowDetails(withTVId: tvId)
    }
    func setupUI(){
        activityIndicatorView.isHidden = false
        tableView.isHidden = true
    }
    func configureUI(){
        
        showNameLabel.text = viewModel.tvShowDataSource?.name
        airDateLabel.text = viewModel.tvShowDataSource?.firstAirDate
        ratedLabel.text = viewModel.tvShowDataSource?.type
        descriptionTextView.text = viewModel.tvShowDataSource?.overview
        numberOfSeasonsLabel.text = viewModel.tvShowDataSource?.numberOfSeasonsText()
        backDropImageView.loadImage(withUrlString: viewModel.tvShowDataSource?.fullBackDropPath(size: .w500), placeholderImage: UIImage(named: "emptyImage"))
    }
    
    private func bindViewModel() {
        
        viewModel.dataLoaded.bind {[unowned self] (value) in
            
            self.configureUI()
            self.activityIndicatorView.isHidden = true
            self.tableView.isHidden = false
            self.tableView.reloadData()
            
        }
//        viewModel.isLoadingSeasonDetails.bind { [unowned self](value) in
//            self.tableView.reloadData()
//        }
        viewModel.seasonDetailsLoaded.bind { [unowned self] (value) in
            self.tableView.reloadData()
        }
        viewModel.error.bind { (value) in
            self.activityIndicatorView.isHidden = true
            let alert = UIAlertController(title: "", message: value, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func playButtonPressed(_ sender: Any) {
        
        guard let videoUrl = URL(string: VideoURLS.videoUrl) else {
            return
        }
        let player = AVPlayer(url: videoUrl)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
    
}
// MARK: - Table view data source, Delegate
extension TVShowDetailsViewController : UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(viewModel.totalEpisodesOfSeason() == 0){
            return 1
        }
        return viewModel.totalEpisodesOfSeason()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(viewModel.totalEpisodesOfSeason() == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.loadingIndicatorCellIdentifier)
            return cell!
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.episodeTableViewCellIdentifier) as! TVEpisodeTableViewCell
        let episodeCellViewModel = viewModel.episodeCellViewModel(at: indexPath.row)
        cell.configure(episodeViewModel: episodeCellViewModel)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(viewModel.totalEpisodesOfSeason() == 0){
            return 250.0
        }
        return 115.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.tVSeasonSelectionHeaderCell) as! TVSeasonSelectionHeaderCell
        cell.dataSource = viewModel.tvShowDataSource?.seasons
        cell.delegate = self
        cell.selectedIndex = viewModel.selectedSeasonNumber - 1
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 55.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
// MARK: - Season selection Delegate
extension TVShowDetailsViewController: SeasonSelectionDelegate{
    
    func tvSeasonSelected(_ season: TVSeasonAPIModel) {
        //load this tv season.
        viewModel.getTVSeasonDetails(withTVId: tvId, seasonNumber: "\(season.seasonNumber)")
    }
}
