//
//  HomeTableViewCell.swift
//  Movie Theater App
//
//  Created by Brad on 6/21/22.
//

import UIKit
import Alamofire



class HomeTableViewCell: UITableViewCell {
    let homeContollerViewModel = HomeViewModel()
    
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
    
   
    func downloadMovies() {
        let url = "\(Constants.baseURL)/3/trending/movie/week?\(Constants.APIKEY)"
        AF.request(url).responseJSON { response in
            do{
                let decoder = JSONDecoder()
                guard let data = response.data else { return }
                let allData = try decoder.decode(ResultsMovies.self, from: response.data!)
                guard let results = allData.results else { return }
                self.homeContollerViewModel.moviesArray = results
                DispatchQueue.main.async{
                    self.homeCollectionView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }
        
    }
    
    func downloadTV() {
        let url = "\(Constants.baseURL)/3/trending/tv/week?\(Constants.APIKEY)"
        AF.request(url).responseJSON { response in
            do{
                let decoder = JSONDecoder()
                guard let data = response.data else { return }
                let allData = try decoder.decode(ResultsTV.self, from: data)
                guard let results = allData.results else { return }
                self.homeContollerViewModel.tvArray = results
                DispatchQueue.main.async{
                    self.homeCollectionView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func downloadPopularMedia() {
        let url = "\(Constants.baseURL)/3/movie/popular?\(Constants.APIKEY)"
        AF.request(url).responseJSON { response in
            do{
                let decoder = JSONDecoder()
                guard let data = response.data  else { return }
                let allData = try decoder.decode(ResultPopular.self, from: data)
                guard let results = allData.results else { return }
                self.homeContollerViewModel.popularArray = results
                
                
                DispatchQueue.main.async{
                    self.homeCollectionView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func downloadUpcomingMedia() {
        
        let url = "\(Constants.baseURL)/3/movie/upcoming?\(Constants.APIKEY)"
        AF.request(url).responseJSON { response in
            do{
                let decoder = JSONDecoder()
                let allData = try decoder.decode(UpcomingResults.self, from: response.data!)
                self.homeContollerViewModel.upcomingArray = allData.results!
                DispatchQueue.main.async{
                    self.homeCollectionView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}
