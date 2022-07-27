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
    
    private func testDownload() {
        APImanager.shared.donwloadTrendingMovies { results in
            
        }
    }
    func downloadMovies() {
        let url = "https://api.themoviedb.org/3/trending/movie/week?api_key=35ac442f569f30ef7e79254f7511fb2d"
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
        let url = "https://api.themoviedb.org/3/trending/tv/week?api_key=35ac442f569f30ef7e79254f7511fb2d"
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
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=35ac442f569f30ef7e79254f7511fb2d&language=en-US&page=1"
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
        
        let url = "https://api.themoviedb.org/3/movie/upcoming?api_key=35ac442f569f30ef7e79254f7511fb2d&language=en-US&page=1"
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
