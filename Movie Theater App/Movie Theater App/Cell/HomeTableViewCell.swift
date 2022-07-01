//
//  HomeTableViewCell.swift
//  Movie Theater App
//
//  Created by Brad on 6/21/22.
//

import UIKit
import Alamofire

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    var moviesArray: [Movies] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        homeCollectionView.collectionViewLayout = layout

    }
    
   
    
    func downloadJson(url: String) {
        
//      let url = "https://api.themoviedb.org/3/trending/movie/week?api_key=35ac442f569f30ef7e79254f7511fb2d"
        AF.request(url).responseJSON { response in
            do{
                let decoder = JSONDecoder()
                let allData = try decoder.decode(ResultsMovies.self, from: response.data!)
                self.moviesArray = allData.results!
                DispatchQueue.main.async{
                    self.homeCollectionView.reloadData()
                }
            }catch{
                print("JSON is missing")
            }
        }
        
    }


}
