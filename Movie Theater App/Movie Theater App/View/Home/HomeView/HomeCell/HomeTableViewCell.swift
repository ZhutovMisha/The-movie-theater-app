//
//  HomeTableViewCell.swift
//  Movie Theater App
//
//  Created by Brad on 6/21/22.
//

import UIKit



class HomeTableViewCell: UITableViewCell {
    let homeTableViewCellModel = HomeViewModel()
    
    let networkManager = NetworkManager.shared
    
    @IBOutlet weak var homeCollectionView: UICollectionView!

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        homeCollectionView.collectionViewLayout = layout
        
        
    }
    
    
    
    func downloadAllData () {
        switch self.homeTableViewCellModel.type {
        case .movie : downloadMovies()
        case .TV : downloadTV()
        case .upcoming : downloadUpcoming()
        case .popular : downloadPopular()
        }
    }
    
    func returnMediaCount() -> Int {
        switch self.homeTableViewCellModel.type {
        case .movie : return homeTableViewCellModel.moviesArray.count
        case .TV : return homeTableViewCellModel.tvArray.count
        case .popular : return homeTableViewCellModel.popularArray.count
        case .upcoming : return homeTableViewCellModel.upcomingArray.count
        }
    }
    
    func downloadMovies () {
        self.homeTableViewCellModel.downloadMovies {
            self.homeCollectionView.reloadData()
        }
    }
    
    func downloadTV() {
        self.homeTableViewCellModel.downloadTV {
            self.homeCollectionView.reloadData()
        }
    }
    
    func downloadPopular () {
        self.homeTableViewCellModel.downloadPopular {
            self.homeCollectionView.reloadData()
        }
    }
    func downloadUpcoming() {
        self.homeTableViewCellModel.downloadUpcoming {
            self.homeCollectionView.reloadData()
        }
    }
    
    

}
