//
//  HomeCollectionViewExtensions.swift
//  Movie Theater App
//
//  Created by Brad on 6/21/22.
//

import Foundation
import UIKit


extension HomeTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0 : return moviesArray.count
        case 1: return tvArray.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        
        switch indexPath.item{
        case 0 : let item = moviesArray[indexPath.row]
            cell.configureMovie(item: item)
            //        case 1: let item = tvArray[indexPath.row]
            //            cell.configureTV(item: item)
            //        case 2: let item = popularArray[indexPath.row]
            //            cell.configurePopular(item: item)
            //        case 3: let item = upcomingArray[indexPath.row]
            //            cell.configureUpcoming(item: item)
        default:
            break
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = moviesArray[indexPath.row]
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController{
            viewController.movie = movie
            guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else { return }
            rootVC.present(viewController, animated: true)
            
            
            
            //MARK: - ViewController Push
            
            //        switch indexPath.item {
            //        case 0 :    let movie = moviesArray[indexPath.row]
            //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //
            //            guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
            //
            //            let model = DetailsModel(movieTitleLabel: movie.title, movieDescriptionLbl: movie.overview, ratingLbl: String(format : "%.2f",movie.vote_average!) , languageLbl: movie.original_language, movieTypeLbl: movie.media_type, releaseDateLbl: movie.release_date)
            //            viewcontroller.configureTest(model: model)
            //            viewcontroller.movie = movie
            //            pushViewController(viewContoller: viewcontroller)
            //
            //        case 1:    let tv = tvArray[indexPath.row]
            //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //
            //            guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
            //
            //            let model = DetailsModel(movieTitleLabel: tv.name, movieDescriptionLbl: tv.overview, ratingLbl: String(format : "%.2f",tv.vote_average!) , languageLbl: tv.original_language, movieTypeLbl: tv.media_type, releaseDateLbl: tv.first_air_date)
            //            viewcontroller.configureTest(model: model)
            //            viewcontroller.tv = tv
            //            pushViewController(viewContoller: viewcontroller)
            //
            //        case 2:    let popular = popularArray[indexPath.row]
            //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //
            //            guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
            //
            //            let model = DetailsModel(movieTitleLabel: popular.title, movieDescriptionLbl: popular.overview, ratingLbl: String(format : "%.2f",popular.vote_average!) , languageLbl: popular.original_language, releaseDateLbl: popular.release_date)
            //            viewcontroller.configureTest(model: model)
            //            viewcontroller.popular = popular
            //            pushViewController(viewContoller: viewcontroller)
            //
            //        case 3:    let upcoming = upcomingArray[indexPath.row]
            //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //
            //            guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
            //
            //            let model = DetailsModel(movieTitleLabel: upcoming.title, movieDescriptionLbl: upcoming.overview, ratingLbl: String(format : "%.2f",upcoming.vote_average!) , languageLbl: upcoming.original_language, releaseDateLbl: upcoming.release_date)
            //            viewcontroller.configureTest(model: model)
            //            viewcontroller.upcoming = upcoming
            //            pushViewController(viewContoller: viewcontroller)
            //
            //        default : break
            //        }
            
            
            
        }
        
    }
}




private func pushViewController(viewContoller: UIViewController) {
    guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else { return }
    rootVC.present(viewContoller, animated: true)
}
