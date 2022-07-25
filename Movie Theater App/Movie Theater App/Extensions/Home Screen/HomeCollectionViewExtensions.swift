//
//  HomeCollectionViewExtensions.swift
//  Movie Theater App
//
//  Created by Brad on 6/21/22.
//

import Foundation
import UIKit
import SDWebImage

extension HomeTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch type{
        case .movie : return moviesArray.count
        case .TV : return tvArray.count
        case .popular : return popularArray.count
        case.upcoming : return upcomingArray.count
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        
        switch type {
        case .movie :
            let item = moviesArray[indexPath.row]
            cell.configureMovie(item: item)
            
        case .TV:
            let item = tvArray[indexPath.row]
                        cell.configureTV(item: item)
            
        case .popular:
            let item = popularArray[indexPath.row]
                        cell.configurePopular(item: item)
            
        case .upcoming: let item = upcomingArray[indexPath.row]
                        cell.configureUpcoming(item: item)
        default:
            break
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        

            
            //MARK: - ViewController Push
            
                    switch type {
                        
                    case .movie :
                        let movie = moviesArray[indexPath.row]
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
                        guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
            
                        guard let url = URL(string: "https://image.tmdb.org/t/p/w500" + (movie.poster_path ?? "")) else { return }
                        guard let data = try? Data(contentsOf: url) else { return }
                        guard let image = UIImage(data: data) else { return }
            
                        let model = DetailsModel(movieTitleLabel: movie.title ?? "", movieDescriptionLbl: movie.overview ?? "", ratingLbl: String(format : "%.2f",movie.vote_average!) , languageLbl: movie.original_language ?? "",  releaseDateLbl: movie.release_date ?? "", movieImageView: image, movieTypeLbl: movie.media_type ?? "" )
                        
                        viewcontroller.loadView()
                        
                        viewcontroller.configureTest(model: model)
                        viewcontroller.movie = movie
                        pushViewController(viewContoller: viewcontroller)
            
                    case .TV :    let tv = tvArray[indexPath.row]

                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
                        guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
                        
                        
                        guard let url = URL(string: "https://image.tmdb.org/t/p/w500" + (tv.poster_path ?? "")) else { return }
                        guard let data = try? Data(contentsOf: url) else { return }
                        guard let image = UIImage(data: data) else { return }
            
                        let model = DetailsModel(movieTitleLabel: tv.name ?? "" , movieDescriptionLbl: tv.overview ?? "" , ratingLbl: String(format : "%.2f",tv.vote_average!) ?? ""  , languageLbl: tv.original_language ?? "",  releaseDateLbl: tv.first_air_date ?? "", movieImageView: image, movieTypeLbl: tv.media_type ?? "" )
                        
                        viewcontroller.loadView()

                        viewcontroller.configureTest(model: model)
                        viewcontroller.tv = tv
                        pushViewController(viewContoller: viewcontroller)
            
                    case .popular:    let popular = popularArray[indexPath.row]

                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
                        guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
                        
                        guard let url = URL(string: "https://image.tmdb.org/t/p/w500" + (popular.poster_path ?? "")) else { return }
                        guard let data = try? Data(contentsOf: url) else { return }
                        guard let image = UIImage(data: data) else { return }
            
            
                        let model = DetailsModel(movieTitleLabel: popular.title ?? "", movieDescriptionLbl: popular.overview ?? "", ratingLbl: String(format : "%.2f",popular.vote_average!) , languageLbl: popular.original_language ?? "" , releaseDateLbl: popular.release_date ?? "", movieImageView: image, movieTypeLbl: "")
                        viewcontroller.loadView()

                        viewcontroller.configureTest(model: model)
                        viewcontroller.popular = popular
                        pushViewController(viewContoller: viewcontroller)
            
                    case .upcoming:    let upcoming = upcomingArray[indexPath.row]

                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
                        guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
                        
                        guard let url = URL(string: "https://image.tmdb.org/t/p/w500" + (upcoming.poster_path ?? "")) else { return }
                        guard let data = try? Data(contentsOf: url) else { return }
                        guard let image = UIImage(data: data) else { return }
            
                        let model = DetailsModel(movieTitleLabel: upcoming.title ?? "" , movieDescriptionLbl: upcoming.overview ?? "" , ratingLbl: String(format : "%.2f",upcoming.vote_average!)  ?? "" , languageLbl: upcoming.original_language ?? "",  releaseDateLbl: upcoming.release_date ?? "", movieImageView: image, movieTypeLbl: "")
                        viewcontroller.loadView()

                        viewcontroller.configureTest(model: model)
                        viewcontroller.upcoming = upcoming
                        pushViewController(viewContoller: viewcontroller)
            
                    default : break
                    }
            
        }
        
    }





private func pushViewController(viewContoller: UIViewController) {
    guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else { return }
    rootVC.present(viewContoller, animated: true)
}

